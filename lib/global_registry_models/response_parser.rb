module GlobalRegistryModels
  class ResponseParser

    def initialize(global_registry_response)
      @response_hash = global_registry_response
    end

    def meta
      @response_hash['meta']
    end

    def objects
      @objects ||= build_entity_types if @response_hash['entity_types']
      @objects ||= build_entities if @response_hash['entities']
      @objects
    end

    private

      def build_entities
        @response_hash['entities'].collect(&:flatten).collect do |object_type, object_attributes|
          entity_class(object_type).new(object_attributes)
        end
      end

      def build_entity_types
        @response_hash['entity_types'].collect do |object_attributes|
          puts object_attributes.to_s
          GlobalRegistryModels::EntityType::EntityType.new(object_attributes)
        end
      end

      def entity_class(entity_type_string)
        return "GlobalRegistryModels::Entity::#{ entity_type_string.classify }".constantize 
      end
  end
end
