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

  it "has a category counter cache" do
    category = FactoryGirl.create(:category)
    expect{
      3.times do
        FactoryGirl.create(:image, :category => category)
      end
      category.reload
    }.to change{category.images_count}.by(3)
  end

  it "sends a e-mail" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    FactoryGirl.create(:subscribe, :category => category, :user => user)
    FactoryGirl.create(:subscribe, :category => category, :user => user2)
    FactoryGirl.create(:image, :category => category)
    ActionMailer::Base.deliveries.last.to.should == [user.email, user2.email]
  end

end
