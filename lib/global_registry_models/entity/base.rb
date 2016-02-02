# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities



module GlobalRegistryModels
  module Entity
    class Base < CommonBase

      def self.search_params
        {
          entity_type: name
        }
      end

      def self.global_registry_resource
        GlobalRegistry::Entity
      end

      def self.attributes_hash(attributes)
        {'entity'.to_sym => { name => attributes }} 
      end
      
    end
  end
end
