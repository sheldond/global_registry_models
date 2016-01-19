# A base class providing CRUD for GlobalRegistry Entities.
# API doc at https://github.com/CruGlobal/global_registry_docs/wiki/Entities

require 'active_model'
require 'virtus'
require 'global_registry_models/common_base.rb'

module GlobalRegistryModels
  module Entity
    class Base < CommonBase

      include GlobalRegistryModels::Entity::APIOperations::Persistence
      include GlobalRegistryModels::Entity::APIOperations::Finders
      include GlobalRegistryModels::Entity::APIOperations::Search
      include GlobalRegistryModels::Entity::APIOperations::Delete

    end
  end
end
