ActiveSupport::Notifications.subscribe "images.like" do |name, start, finish, id, payload|
  #Rails.logger.debug "==================EARCH: #{payload[:like]} asd #{payload[:user]}"
  Event.create! do |e|
    e.user = payload[:user]
    e.eventable = payload[:like]
  end
end
ActiveSupport::Notifications.subscribe "comments.create" do |name, start, finish, id, payload|
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
ActiveSupport::Notifications.subscribe "images.authf" do |name, start, finish, id, payload|
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
ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
  Rails.logger.debug "SEARCH: =========================#{Rails.application.config.session}"
  #Rails.logger.debug "SEARCH: =========================#{payload[:path]}"

  #navigation = Navigation.find_or_create_by_url(payload[:path])
  ##user = Authorization.current_user
  #Event.create! do |e|
  #  e.eventable = navigation
  #  e.user = User.last
  #end
end