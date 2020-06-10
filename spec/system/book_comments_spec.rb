require 'rails_helper'

describe 'コメントのテスト' do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:book_comment) { create(:book_comment, user_id: user.id, book_id: book.id) }
  before do
  	visit new_user_session_path
  	fill_in 'user[name]', with: user.name
  	fill_in 'user[password]', with: user.password
  	click_button 'Log in'
  	fill_in 'book[title]', with: Faker::Lorem.characters(number:5)
	fill_in 'book[body]', with: Faker::Lorem.characters(number:20)
	click_button 'Create Book'
  end
  describe 'コメント投稿のテスト' do
		context '表示の確認' do
		  it 'commentフォームが表示される' do
		  	expect(page).to have_field 'book_comment[comment]'
		  end
		  it '送信ボタンが表示される' do
		  	expect(page).to have_button '送信'
		  end
		  it '投稿に成功する' do
		  	fill_in 'book_comment[comment]', with: Faker::Lorem.characters(number:5)
		  	click_button '送信'
		  	expect(page).to have_css ".comment", text: '1'
		  end
		  it '投稿に失敗する' do
		  	click_button '送信'
		  	expect(page).to have_no_css ".comment", text: '1'
		  end
		end
	end
  end