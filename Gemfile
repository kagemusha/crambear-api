source 'https://rubygems.org'
ruby '2.2.0'
gem 'rails', '4.2.0'
gem 'pg'
gem 'rack-cors', :require => 'rack/cors'
gem 'doorkeeper'
gem 'devise'
gem 'pundit'
gem "rolify"

gem 'json'
gem 'json-jwt'
gem 'jsonapi-resources'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'foreman'
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'thin'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
end
group :production do
  gem 'unicorn'
end
