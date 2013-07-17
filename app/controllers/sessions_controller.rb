class SessionsController < Devise::SessionsController
  def create
    super
    if user_signed_in?
      Event.track_event('sessions.create', {:user => current_user})
    end
  end
  def destroy
    user = current_user
    super
    if !user_signed_in?
      Event.track_event('sessions.destroy', {:user => user})
    end
  end
end
