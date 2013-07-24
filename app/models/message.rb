# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#

class Message < ActiveRecord::Base
  attr_accessible :body, :user
  belongs_to :user

  scope :message_on_last_hour, lambda { where("created_at >= ?", Time.zone.now-3600) }
end
