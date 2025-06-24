# frozen_string_literal: true

require 'active_record'
require 'create_or_update'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :dummy_models, force: true do |t|
    t.string :unique_attribute
    t.string :other_attribute
    t.string :third_attribute
  end
end

# Define a dummy model for testing the concern
class DummyModel < ActiveRecord::Base
  include CreateOrUpdate
  identifier :unique_attribute, :other_attribute
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
