class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers

  before_filter :track_url
  before_filter :message

  def track_url
    Event.track_event('track_url', {:url => request.url, :user => current_user}) if !current_user.nil?
  end

  def message
    @messages = Message.message_on_last_hour.preload(:user)
    @message = Message.new
  end
end
