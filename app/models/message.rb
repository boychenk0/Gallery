class Message < ActiveRecord::Base
  attr_accessible :body, :user
  belongs_to :user

  scope :message_on_last_hour, lambda { where("created_at >= ?", Time.zone.now-3600) }
end
