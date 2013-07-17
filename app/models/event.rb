class Event < ActiveRecord::Base
  attr_accessible :date, :eventable_id, :eventable_type, :user
  belongs_to :user
  belongs_to :eventable, :polymorphic => true

  def self.track_event(type, data = {})
    ActiveSupport::Notifications.instrument(type, data)
  end
end
