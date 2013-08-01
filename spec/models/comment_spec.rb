# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  image_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#

require 'spec_helper'

describe Comment do

  it {should allow_mass_assignment_of(:body)}
  it {should allow_mass_assignment_of(:image)}
  it {should allow_mass_assignment_of(:created_at)}
  it {should allow_mass_assignment_of(:user)}

  it {should have_db_column(:id).of_type(:integer).with_options(:null => false, :primary_key => true)}
  it {should have_db_column(:body).of_type(:string).with_options(:limit => 255, :null => false)}
  it {should have_db_column(:image_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:user_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_index(:image_id)}
  it {should have_db_index(:user_id)}

  it {should belong_to(:image)}
  it {should belong_to(:user)}
  it {should have_many(:events).dependent(:destroy)}

  it {should validate_presence_of(:image)}
  it {should validate_presence_of(:body)}
  it {should ensure_length_of(:body).is_at_most(500)}

  it 'has a comments counter cache' do
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
