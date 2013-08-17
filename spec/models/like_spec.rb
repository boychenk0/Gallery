# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  image_id   :integer          not null
#  created_at :datetime         not null
#

require 'spec_helper'

describe Like do

  it {should have_db_column(:id).of_type(:integer).with_options(:null=>false, :primary_key=> true)}
  it {should have_db_column(:user_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:image_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null=>false)}
  it {should have_db_index(:image_id)}
  it {should have_db_index(:user_id)}

  it {should allow_mass_assignment_of(:image_id)}
  it {should allow_mass_assignment_of(:user_id)}

  it {should belong_to(:image)}
  it 'has a likes counter cache' do
    likes = []
    users = []
    3.times do
      users << FactoryGirl.create(:user)
    end
    category = FactoryGirl.create(:category)
    image = FactoryGirl.create(:image, :category => category)
    expect{
      3.times do |n|
        likes << FactoryGirl.create(:like, :image=>image, :user => users[n])
      end
      image.reload
    }.to change{image.likes_count}.by(3)
  end
  it {should belong_to(:user)}
  it {should have_many(:events).dependent(:destroy)}

  it {should validate_presence_of(:image)}
  it {should validate_presence_of(:user)}
  it {
        category = FactoryGirl.create(:category)
        image = FactoryGirl.create(:image, :category => category)
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:like, :user => user, :image => image)
        should validate_uniqueness_of(:image_id).scoped_to(:user_id)
     }
end
