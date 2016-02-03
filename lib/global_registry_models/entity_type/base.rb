# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities


module GlobalRegistryModels
  module EntityType
    class Base < CommonBase

      def self.search_params
        {
          field_type: "entity"
        }
      end

      def self.global_registry_resource
        GlobalRegistry::EntityType
      end

      def self.attributes_hash(attributes)
        { 
          'entity_type' => attributes 
        }
      end

    end
  end
end
