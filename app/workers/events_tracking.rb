class EventsTracking
  @queue = :events_queue
  def self.perform(type, data)
    ActiveSupport::Notifications.instrument(type, data)
  end
end