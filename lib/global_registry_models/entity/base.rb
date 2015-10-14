# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities

require 'active_model'
require 'virtus'

module GlobalRegistryModels
  module Entity
    class Base
      include ActiveModel::Model
      include ActiveModel::Validations
      include Virtus.model

      include GlobalRegistryModels::Entity::APIOperations::Persistence
      include GlobalRegistryModels::Entity::APIOperations::Finders
      include GlobalRegistryModels::Entity::APIOperations::Search
      include GlobalRegistryModels::Entity::APIOperations::Delete

      attribute :id, String
      attribute :client_integration_id, String

      validates_presence_of :client_integration_id

      def self.title
        name.titleize
      end

      def self.attribute_names
        attribute_set.collect(&:name)
      end

      def self.filterable_attributes
        attribute_names
      end

      def self.identifying_attributes
        [:id]
      end

      def self.writeable_attributes
        attribute_names - [:id]
      end

      # The name of the entity class. The entity name is required in the api responses and requests, hence the need for this class method.
      def self.name
        to_s.gsub(/.*::/, '').underscore
      end

    end
  end
end
