# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do |com|
    #association :image
    #association :user
    com.sequence(:body) {|n| "Test Comment #{n}"}
  end
end
