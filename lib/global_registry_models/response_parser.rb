module GlobalRegistryModels
  class ResponseParser

    def initialize(global_registry_response)
      @response_hash = global_registry_response
    end

    def meta
      @response_hash['meta']
    end

    def entities
      @entities ||= build_objects('entities')
    end

     def entity_types
      @entity_types ||= build_objects('entity_types')
    end

    private

      def build_objects(object_class)
        @response_hash[object_class].collect(&:flatten).collect do |object_type, object_attributes|
          entity_class(object_type).new(object_attributes)
        end
      end

      def entity_class(entity_type_string)
        "GlobalRegistryModels::Entity::#{ entity_type_string.classify }".constantize
      end
  end
end
