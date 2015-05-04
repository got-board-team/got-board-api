source 'https://rubygems.org'

ruby '2.2.2'

gem 'dotenv-rails', '2.0.1'

gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.12'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Brings convention over configuration to your JSON generation
# Read more: https://github.com/rails-api/active_model_serializers
gem 'active_model_serializers', '~> 0.9.3'
  #git: 'https://github.com/rails-api/active_model_serializers.git',
  #tag: 'v0.10.0.rc1'
# Use ActiveModel has_secure_password
#
# gem 'bcrypt', '3.1.10'

# Use Unicorn as the app server
# gem 'unicorn', '4.8.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rails-env', '0.3.0'

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.3'
  gem 'spring-commands-rspec', '~> 1.0'
  gem 'awesome_print', '~> 1.6'
  gem 'rspec-rails', '~> 3.2'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'database_cleaner', '~> 1.4'
  gem 'pry-byebug', '~> 3.1'
  gem 'pry-remote', '~> 0.1'
end

group :development do
  gem 'better_errors', '~> 2.1'
  gem 'binding_of_caller', '~> 0.7'
  gem 'meta_request', '~> 0.3'
  gem 'quiet_assets', '~> 1.1'
  gem 'bullet', '~> 4.14'
  gem 'nokogiri', '~> 1.6.6.2'
end

group :test do
  gem 'api_matchers', '~> 0.6'
  gem 'timecop', '~> 0.7'
  gem 'fuubar', '~> 2.0'
  gem 'shoulda-matchers', '~> 2.8'
  gem 'simplecov', '~> 0.9', require: false
  gem 'codeclimate-test-reporter', '~> 0.4', require: false
end
