# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    url "MyString"
    comment_count 1
    likes 1
  end
end
