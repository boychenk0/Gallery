# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  url            :string(255)
#  category_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  likes_count    :integer          default(0)
#  comments_count :integer          default(0)
#

require 'spec_helper'

describe Image do

  it { should allow_mass_assignment_of(:url) }
  it { should allow_mass_assignment_of(:category) }

  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:users).through(:likes) }
  it { should belong_to(:category) }

  it {should have_db_column(:id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:url).of_type(:string).with_options(:limit => 255)}
  it {should have_db_column(:category_id).of_type(:integer)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_column(:likes_count).of_type(:integer).with_options(:default => 0)}
  it {should have_db_column(:comments_count).of_type(:integer).with_options(:default => 0)}

  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:category) }

  #it "has a counter cache" do
  #  user = FactoryGirl.create(:user)
  #  expect {
  #    user.media.create(caption: "Test media")
  #  }.to change { User.last.media_count }.by(1)
  #end

  before(:each)do
    img = []
    3.times do
      img << FactoryGirl.create(:image)
    end
    puts img[0].inspect
    puts img[0].category.inspect
    cat = img[0].category
    puts cat.images_count
    puts img[0].category.users
  end
end
