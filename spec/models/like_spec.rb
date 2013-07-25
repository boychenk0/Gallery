# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  image_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Like do

  it "has a likes counter cache" do
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
end
