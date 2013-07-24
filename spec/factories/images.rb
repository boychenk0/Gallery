# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    #association :user
    association :category, :factory => :category
    url { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'factories', 'files', 'test.jpg')) }
  end
end
