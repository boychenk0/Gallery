class ApplicationController < ActionController::Base
  protect_from_forgery
  include SimpleCaptcha::ControllerHelpers
  before_filter :track_url

  def track_url
    Event.track_event('track_url', {:url => request.url, :user => current_user}) if !current_user.nil?
    #ActiveSupport::Notifications.instrument("application.track_url", :url => request.url, :user => current_user) if !current_user.nil?
  end
end
