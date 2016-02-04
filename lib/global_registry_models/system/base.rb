module GlobalRegistryModels
  module System
    class Base < CommonBase

      def self.search_params
        {}
      end

      def self.global_registry_resource
        GlobalRegistry::System
      end

      def self.attributes_hash(attributes)
        { 
          'system' => attributes 
        }
      end

    end
  end
end