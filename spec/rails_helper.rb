# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec'
require 'rspec/rails'
require 'factory_girl'
require 'generator_spec/test_case'
require 'capybara'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

FactoryGirl.find_definitions

Capybara.default_wait_time = ENV['CAPYBARA_WAIT_TIME'].present? ? ENV['CAPYBARA_WAIT_TIME'].to_i : 10

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    debug: false,
    # phantomjs_options: ['--load-images=no', '--disk-cache=false'],
    js_errors: false
  })
end

Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

def clean_database
  Article.find_by_sql("delete from articles; delete from redditor_pages; delete from redditor_slider_blocks; delete from redditor_text_blocks; delete from redditor_video_pages; delete from redditor_images")
end

RSpec.configure do |config|
  config.after(:all) do
    if Rails.env.test?
      FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"])
    end
  end

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def wait_until
  require 'timeout'
  Timeout.timeout(Capybara.default_wait_time) do
    sleep(0.1) until value = yield
    value
  end
end
