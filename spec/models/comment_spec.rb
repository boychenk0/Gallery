# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  image_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Comment do
  it "has a comments counter cache" do
    comments = []
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    image = FactoryGirl.create(:image, :category => category)
    expect{
      3.times do
        comments << FactoryGirl.create(:comment, :image=>image, :user => user)
      end
      image.reload
    }.to change{image.comments_count}.by(3)
  end
end
