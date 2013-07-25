# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :navigation do |nav|
    nav.sequence(:url) {|n| "http://localhost:3000/#{n}"}
  end
end
