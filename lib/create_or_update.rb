# frozen_string_literal: true

require_relative "create_or_update/version"
require "railtie" if defined?(Rails)

module CreateOrUpdate
  class Error < StandardError; end

  extend ActiveSupport::Concern

  included do
    class_attribute :identifiers
  end

  class_methods do
    def identifier(*attrs)
      self.identifiers = attrs
    end

    def create_or_update(attributes)
      attributes.symbolize_keys!

      record = find_by(attributes.slice(*identifiers)) || new

      # If the record's attributes are the same as the incoming attributes, return the record without saving.
      return record if record.persisted? && attributes.all?{ |key, value| record[key] == value }

      record.assign_attributes(attributes)
      record.save if record.changed?

      record
    end
  end
end
