source 'https://rubygems.org'
ruby '2.1.1'
gem 'rails', '4.1.0'
gem 'sqlite3'
gem 'devise'
gem 'pundit'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'foreman'
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'thin'
end
group :production do
  gem 'unicorn'
end
