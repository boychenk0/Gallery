source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.13'
gem 'jquery-rails'
#gem "jquery-ui-rails", "~> 4.0.3"
#kaminari for paginate
gem 'kaminari'
#carrerwave for images
gem 'carrierwave'
#activeAcmin
gem 'activeadmin'
gem 'devise'
gem 'haml-rails'
gem 'pg'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'nokogiri'
gem 'curb'
gem 'galetahub-simple_captcha', :require => 'simple_captcha'
gem 'rmagick'
gem 'pusher', '~> 0.9.4'
gem 'ransack', '~> 0.7.2'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :assets do
  gem 'bootstrap-sass', '~> 2.3.2.0'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'libv8', '~> 3.11.8'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', :platform=>:ruby, :require=>"v8"
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'html2haml'
  gem 'bullet'
  gem 'annotate', '>=2.5.0'
  gem 'hirb', '~> 0.7.1'
end

group :development, :test do
  gem 'puma'
  gem 'rspec-rails', '>= 2.8.1'
  #gem 'capybara-webkit'
  gem 'database_cleaner', '~> 0.6.7'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'factory_girl_rails', '>= 1.6.0'
  gem 'simplecov', :require => false
  gem 'capybara', '>= 1.1.2'
  #gem 'database_cleaner'
  gem 'email_spec'
  #gem 'cucumber-rails', '>= 1.2.1'
  gem 'launchy'
  #gem "rspec", "~> 2.14.1"
  gem "shoulda-matchers", "~> 2.2.0"
  #gem 'selenium-webdriver'
end

