Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '209575219198140', '7a5b6ff0df5c72dc79e372379bcc56f6', :scope => 'email', :provider_ignores_state => true
end
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}