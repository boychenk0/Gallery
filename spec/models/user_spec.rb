# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  uid                    :float            default(0.0)
#  provider               :string(255)      default("")
#  nickname               :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

require 'spec_helper'

describe User do

  it {should have_db_column(:uid).of_type(:float).with_options(:default => 0.0)}
  it {should have_db_column(:provider).of_type(:string).with_options(:limit => 255, :default => '')}
  it {should have_db_column(:nickname).of_type(:string).with_options(:limit => 255, :default => '', :null => false)}

  it {should have_many(:images).through(:likes)}
  it {should have_many(:categories).through(:subscribes)}
  it {should have_many(:comments).dependent(:destroy)}
  it {should have_many(:subscribes).dependent(:destroy)}
  it {should have_many(:likes).dependent(:destroy)}
  it {should have_many(:events).dependent(:destroy)}
  it {should have_many(:messages).dependent(:destroy)}

  it {should validate_presence_of(:nickname)}

end
