# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user_id 1
    event_type "MyString"
    event_id 1
    date "2013-07-16 14:31:08"
  end
end
