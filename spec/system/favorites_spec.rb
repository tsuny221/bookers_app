require 'rails_helper'

describe 'いいねのテスト' do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:favorite) { create(:favorite, user_id: user.id, book_id: book.id) }
  before do
  	visit new_user_session_path
  	fill_in 'user[name]', with: user.name
  	fill_in 'user[password]', with: user.password
  	click_button 'Log in'
  	fill_in 'book[title]', with: Faker::Lorem.characters(number:5)
	fill_in 'book[body]', with: Faker::Lorem.characters(number:20)
	click_button 'Create Book'
  end
		context 'いいねをクリックした場合' do
		  it 'いいねできる' do
		    find('.fab').click
		    expect(page).to have_css ".glyphicon-heart"
		    expect(page).to have_css ".glyphicon", text: '1'
		  end
		end

		context 'いいねを削除した場合' do
		  it 'いいねを取り消せる' do
		  	find('.fab').click
		  	find('.fab').click
		    expect(page).to have_css ".glyphicon-heart-empty"
		    expect(page).to have_css ".glyphicon", text: '0'
		  end
		end
  end