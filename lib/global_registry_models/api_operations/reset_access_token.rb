module GlobalRegistryModels
  module APIOperations
    module ResetAccessToken
      extend ActiveSupport::Concern

      module ClassMethods
        
        def change_access_token(attributes)
          GlobalRegistry::System.reset_access_token(system_id, prepare_parameters(attributes))
        end

      end
    end
  end
end