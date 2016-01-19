# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities

require 'virtus'

module GlobalRegistryModels
  module EntityType
    class Base < CommonBase

      include GlobalRegistryModels::EntityType::APIOperations::Persistence
      include GlobalRegistryModels::EntityType::APIOperations::Finders
      include GlobalRegistryModels::EntityType::APIOperations::Search
      include GlobalRegistryModels::EntityType::APIOperations::Delete

    end
  end
end
