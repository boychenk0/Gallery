# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do |mes|
    #association :user
    mes.sequence(:body) {|n| "TestMessage#{n}"}
  end
end
