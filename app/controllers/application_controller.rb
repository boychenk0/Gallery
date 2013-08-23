class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

  before_filter :track_url

  def track_url
    Event.track_event('track_url', {:url => request.url, :user_id => current_user.id}) if user_signed_in?
  end


end
