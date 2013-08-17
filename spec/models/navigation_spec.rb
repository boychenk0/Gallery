# == Schema Information
#
# Table name: navigations
#
#  id  :integer          not null, primary key
#  url :string(255)      not null
#

require 'spec_helper'

describe Navigation do

  it {should have_db_column(:id).of_type(:integer).with_options(:null => false, :primary_key=> true)}
  it {should have_db_column(:url).of_type(:string).with_options(:null => false)}

  it {should allow_mass_assignment_of(:url)}

  it {should have_many(:events).dependent(:destroy)}

  it {validate_presence_of(:url)}
  it {validate_uniqueness_of(:url)}


end
