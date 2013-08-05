# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TitsProj::Application.initialize!
ActionController::Base.cache_store = :file_store, "#{Rails.root}/public/cache"
