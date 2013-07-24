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

class Event < ActiveRecord::Base
  attr_accessible :eventable_id, :eventable_type, :user, :created_at
  belongs_to :user
  belongs_to :eventable, :polymorphic => true

  def self.track_event(type, data = {})
    ActiveSupport::Notifications.instrument(type, data)
  end
end
