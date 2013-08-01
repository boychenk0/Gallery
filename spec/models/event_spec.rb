# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  eventable_type :string(255)      not null
#  eventable_id   :integer          not null
#  created_at     :datetime         not null
#

require 'spec_helper'

describe Event do

  it {should allow_mass_assignment_of(:eventable_id)}
  it {should allow_mass_assignment_of(:eventable_type)}
  it {should allow_mass_assignment_of(:user)}
  it {should allow_mass_assignment_of(:created_at)}

  it {should belong_to(:user)}
  it {should belong_to(:eventable)}

  it {should have_db_column(:id).of_type(:integer).with_options(:null => false, :primary_key => true)}
  it {should have_db_column(:user_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:eventable_type).of_type(:string).with_options(:null => false, :limit => 255)}
  it {should have_db_column(:eventable_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_index(:user_id)}
  it {should have_db_index([:eventable_type, :eventable_id])}

  it 'polymorph sign_in test' do
    user = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event, :user => user, :eventable_type => 'sign_in', :eventable_id => user.id)
    event.eventable_type.should == 'sign_in'
  end
  it 'polymorph sign_out test' do
    user = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event, :user => user, :eventable_type => 'sign_out', :eventable_id => user.id)
    event.eventable_type.should == 'sign_out'
  end
  it 'polymorph like test' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    image = FactoryGirl.create(:image, :category => category)
    like = FactoryGirl.create(:like, :user => user, :image => image)
    event = FactoryGirl.create(:event, :user => user, :eventable => like)
    event.eventable_type.should == like.class.to_s
    event.eventable_id.should == like.id
  end
  it 'polymorph comment test' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)
    image = FactoryGirl.create(:image, :category => category)
    comment = FactoryGirl.create(:comment, :image => image, :user => user)
    event = FactoryGirl.create(:event, :user => user, :eventable => comment)
    event.eventable_type.should == comment.class.to_s
    event.eventable_id.should == comment.id
  end
  it 'polymorph navigation test' do
    user = FactoryGirl.create(:user)
    navigation = FactoryGirl.create(:navigation)
    event = FactoryGirl.create(:event, :user => user, :eventable => navigation)
    event.eventable_type.should == navigation.class.to_s
    event.eventable_id.should == navigation.id
  end

end
