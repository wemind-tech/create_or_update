# frozen_string_literal: true

require 'rails/railtie'

# Railtie class for integrating CreateOrUpdate with Rails applications.
# This Railtie initializes the CreateOrUpdate module, making it available
# for Rails applications to use. It can hook into Rails initialization process
# to configure or modify aspects of the application or of the CreateOrUpdate module.
class Railtie < Rails::Railtie
  initializer 'create_or_update.include_in_application_record' do
    ::ActiveSupport.on_load(:active_record) do
      # Ensure ApplicationRecord is loaded. This is necessary because in
      # development mode, classes are not preloaded and are loaded on demand.
      require_dependency 'application_record' unless defined?(::ApplicationRecord)

      ::ApplicationRecord.include(CreateOrUpdate)
    end
  end
end
