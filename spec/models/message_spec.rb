# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#

require 'spec_helper'

describe Message do
  it {should have_db_column(:id).of_type(:integer).with_options(:null => false, :primary_key=> true)}
  it {should have_db_column(:body).of_type(:string).with_options(:null => false, :limit => 255)}
  it {should have_db_column(:user_id).of_type(:integer).with_options(:null => false)}
  it {should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)}
  it {should have_db_index(:user_id)}

  it {should belong_to(:user)}

  it 'scope message_on_last_hour' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:message, :created_at => Time.zone.now-5000, :user => user)
    FactoryGirl.create(:message, :created_at => Time.zone.now-6000, :user => user)
    3.times do
      FactoryGirl.create(:message, :user => user)
    end
    Message.message_on_last_hour.count.should be 3
  end
end
