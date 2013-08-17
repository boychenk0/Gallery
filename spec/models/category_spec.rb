# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  images_count :integer          default(0), not null
#  created_at   :datetime         not null
#

require 'spec_helper'

describe Category do
  it {should allow_mass_assignment_of(:name)}

  it {should have_many(:images).dependent(:destroy)}
  it {should have_many(:subscribes).dependent(:destroy)}
  it {should have_many(:users).through(:subscribes)}

  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}

  it {should have_db_column(:id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:name).of_type(:string).with_options(:limit => 255, :null => false)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_column(:images_count).of_type(:integer).with_options(:default => 0, :null => false) }

  it 'test scope category_sort_by_images_count' do
    category = []
    3.times do
      category << FactoryGirl.create(:category)
    end
    3.times do
      FactoryGirl.create(:image, :category => category[0])
    end
    4.times do
      FactoryGirl.create(:image, :category => category[1])
    end
    2.times do
      FactoryGirl.create(:image, :category => category[2])
    end
    Category.category_sort_by_images_count.first.images_count.should be 4
    Category.category_sort_by_images_count.last.images_count.should be 2
  end

end
