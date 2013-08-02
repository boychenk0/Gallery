# == Schema Information
#
# Table name: subscribes
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#

require 'spec_helper'

describe Subscribe do

  it {should have_db_column(:id).of_type(:integer).with_options(:null => false, :primary_key => true)}
  it {should have_db_column(:user_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:category_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_index(:user_id)}
  it {should have_db_index(:category_id)}

  it {should allow_mass_assignment_of(:category)}
  it {should allow_mass_assignment_of(:user)}

  it {should belong_to(:category)}
  it {should belong_to(:user)}

  it {should validate_presence_of(:category)}
  it {should validate_presence_of(:user)}

end
