# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do |a|
    a.sequence(:email) {|n| "admin#{n}@exammple.com"}
    a.password 'password'
  end
end
