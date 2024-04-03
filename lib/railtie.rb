# frozen_string_literal: true

require 'rails/railtie'

class Railtie < Rails::Railtie

  initializer 'create_or_update.include_in_application_record' do
    ::ActiveSupport.on_load(:active_record) do
      ::ApplicationRecord.include(CreateOrUpdate)
    end
  end
end
