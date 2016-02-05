module GlobalRegistryModels
  module APIOperations
    module ResetAccessToken
      
      def reset_access_token
        System::System.new GlobalRegistry::System.reset_access_token(self.id)['system']
      end

    end
  end
end