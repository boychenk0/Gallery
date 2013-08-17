# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    association :user
    association :eventable#, :factory => :comment
  end
  #factory :comment_user, :parent => :comment do
  #  association :commentable, :factory => :user
  #end
end
