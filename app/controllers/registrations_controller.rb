class RegistrationsController < Devise::RegistrationsController
  include SimpleCaptcha::ControllerHelpers

  def create
    if simple_captcha_valid?
      super
      Event.track_event('authf', {:user => current_user})
    else
      build_resource
      resource.errors.add(:base, 'Please re-enter the captcha code') if resource.valid?
      render :new
    end
  end
end
