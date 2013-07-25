# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  images_count :integer          default(0)
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
  it {should have_db_column(:name).of_type(:string).with_options(:limit => 255)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_column(:images_count).of_type(:integer).with_options(:default => 0) }

  it 'test category_sort_by_images_count' do

  end

end
