# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscribe do
    association :user, :factory=>:user
    association :category, :factory=>:category
  end
end
