module GlobalRegistryModels
  class ResponseParser

    def initialize(global_registry_response)
      @response_hash = global_registry_response
    end

    def meta
      @response_hash['meta']
    end

    def entities
      @entities ||= build_entities
    end

    def entity_types
      @entity_types ||= build_entity_types
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
          GlobalRegistryModels::EntityType::EntityType.new(object_attributes.to_s)
        end
      end

      def entity_class(entity_type_string)
        return "GlobalRegistryModels::Entity::#{ entity_type_string.classify }".constantize 
      end
  end
end
