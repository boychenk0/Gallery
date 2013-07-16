class SessionsController < Devise::SessionsController
  def create
    super
    if user_signed_in?
      ActiveSupport::Notifications.instrument("sessions.create", :user => current_user)
    end
  end
  def destroy
    user = current_user
    super
    logger.info !user_signed_in?
    if !user_signed_in?
      ActiveSupport::Notifications.instrument("sessions.destroy", :user => user)
    end
  end
end
