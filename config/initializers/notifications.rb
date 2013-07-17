ActiveSupport::Notifications.subscribe "like" do |name, start, finish, id, payload|
  #Rails.logger.debug "==================EARCH: #{payload[:like]} asd #{payload[:user]}"
  Event.create! do |e|
    e.user = payload[:user]
    e.eventable = payload[:like]
  end
end
ActiveSupport::Notifications.subscribe "comments" do |name, start, finish, id, payload|
  Event.create! do |e|
    e.user = payload[:user]
    e.eventable = payload[:comment]
  end
end
ActiveSupport::Notifications.subscribe "sessions.create" do |name, start, finish, id, payload|
  Event.create! do |e|
    e.eventable_type = 'sign_in'
    e.eventable_id = payload[:user].id
    e.user = payload[:user]
  end
end
ActiveSupport::Notifications.subscribe "authf" do |name, start, finish, id, payload|
  Event.create! do |e|
    e.eventable_type = 'sign_in'
    e.eventable_id = payload[:user].id
    e.user = payload[:user]
  end
end

ActiveSupport::Notifications.subscribe "sessions.destroy" do |name, start, finish, id, payload|
  Event.create! do |e|
    e.eventable_type = 'sign_out'
    e.eventable_id = payload[:user].id
    e.user = payload[:user]
  end
end
ActiveSupport::Notifications.subscribe "track_url" do |name, start, finish, id, payload|
    navigation = Navigation.find_or_create_by_url(payload[:url])
    Event.create! do |e|
      e.eventable = navigation
      e.user = payload[:user]
    end
end