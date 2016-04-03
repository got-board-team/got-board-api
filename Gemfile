source 'https://rubygems.org'

ruby '2.3.0'

gem 'dotenv-rails', '2.0.1'

gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.0.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.4.1'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.1', group: :doc
# Brings convention over configuration to your JSON generation
# Read more: https://github.com/rails-api/active_model_serializers
gem 'active_model_serializers', '~> 0.9.4'
# Middleware that will make Rack-based apps CORS compatible
gem 'rack-cors', '~> 0.4.0'
# Adds callback hooks for your ActiveModel models for sending messages
# to a Pusher channel
gem 'pusherable', '~> 1.3.0'

gem 'active_interaction', '~> 3.0'

  #git: 'https://github.com/rails-api/active_model_serializers.git',
  #tag: 'v0.10.0.rc1'
# Use ActiveModel has_secure_password
#
# gem 'bcrypt', '3.1.10'

# Use Unicorn as the app server
# gem 'unicorn', '4.8.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails-env', '1.0.6'

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.6'
  gem 'spring-commands-rspec', '~> 1.0'
  gem 'awesome_print', '~> 1.6'
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails', '~> 4.6'
  gem 'database_cleaner', '~> 1.5'
  gem 'pry-byebug', '~> 3.3'
  gem 'pry-remote', '~> 0.1'
end

group :development do
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller', '~> 0.7'
  gem 'meta_request', '~> 0.4'
  gem 'quiet_assets', '~> 1.1'
  gem 'bullet', '~> 5.0'
  gem 'nokogiri', '~> 1.6.7.2'
end

group :test do
  gem 'api_matchers', '~> 0.6'
  gem 'timecop', '~> 0.8'
  gem 'fuubar', '~> 2.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.11', require: false
  gem 'codeclimate-test-reporter', '~> 0.5', require: false
  gem 'codacy-coverage', :require => false
end
