# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities


module GlobalRegistryModels
  module RelationshipType
    class Base < CommonBase

      def self.search_params
        {}
      end

      def self.global_registry_resource
        GlobalRegistry::RelationshipType
      end

      def self.attributes_hash(attributes)
        { 'relationship_type' => attributes }
      end

    end
  end
end
