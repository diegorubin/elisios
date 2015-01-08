require 'cucumber/rails'
require 'capybara/poltergeist'
require 'simplecov'

SimpleCov.start

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app)
end

Capybara.default_driver = :poltergeist
Capybara.default_wait_time = 5
Capybara.current_driver = :webkit

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group)'\
  ' if you wish to use it.'
end

Cucumber::Rails::Database.javascript_strategy = :truncation
