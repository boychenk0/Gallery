Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '209575219198140', '7a5b6ff0df5c72dc79e372379bcc56f6'
end