FactoryBot.define do
  factory :book_comment do
    comment { Faker::Lorem.characters(number:20) }
    book
    user
  end
end