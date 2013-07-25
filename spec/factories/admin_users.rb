# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do |a|
    a.sequence(:email) {|n| "test#{n}@ukr.net"}
    a.password '1234567890'
  end
end
