# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities


module GlobalRegistryModels
  module EntityType
    class Base < CommonBase

      def search_params
        {
          entity_name: name
        }
      end

    end
  end
end
