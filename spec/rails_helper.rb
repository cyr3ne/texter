# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!

  VCR.configure do |c|
    c.ignore_localhost = true #don't record AJAX requests
    c.cassette_library_dir = "spec/cassettes"
    c.hook_into :webmock
    c.configure_rspec_metadata!
  end
end
