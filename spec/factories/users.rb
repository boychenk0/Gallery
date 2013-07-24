# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.nickname 'Jack Vorobey'
    u.sequence(:email) {|n| "test#{n}@ukr.net"}
    u.password '1234567890'
  end
end
