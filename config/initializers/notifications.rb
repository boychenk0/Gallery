ActiveSupport::Notifications.subscribe "like" do |name, start, finish, id, payload|
  like = Like.find(payload['like_id'])
  user = User.find(payload['user_id'])
  Event.create! do |e|
    e.user = user
    e.eventable = like
  end
end
ActiveSupport::Notifications.subscribe "comments" do |name, start, finish, id, payload|
  comment = Comment.find(payload['comment_id'])
  user = User.find(payload['user_id'])
  Event.create! do |e|
    e.user = user
    e.eventable = comment
  end
end
ActiveSupport::Notifications.subscribe "sessions.create" do |name, start, finish, id, payload|
  user = User.find(payload['user_id'])
  Event.create! do |e|
    e.eventable_type = 'sign_in'
    e.eventable_id = user.id
    e.user = user
  end

end
ActiveSupport::Notifications.subscribe "authf" do |name, start, finish, id, payload|
  user = User.find(payload['user_id'])
  Event.create! do |e|
    e.eventable_type = 'sign_in'
    e.eventable_id = user.id
    e.user = user
  end
end

ActiveSupport::Notifications.subscribe "sessions.destroy" do |name, start, finish, id, payload|
  user = User.find(payload['user_id'])
  Event.create! do |e|
    e.eventable_type = 'sign_out'
    e.eventable_id = user.id
    e.user = user
  end
end
ActiveSupport::Notifications.subscribe "track_url" do |name, start, finish, id, payload|
    navigation = Navigation.find_or_create_by_url(payload['url'])
    user = User.find(payload['user_id'])
    Event.create! do |e|
      e.eventable = navigation
      e.user = user
    end
end