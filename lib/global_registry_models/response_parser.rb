module GlobalRegistryModels
  class ResponseParser

    def initialize(global_registry_response)
      @response_hash = global_registry_response
    end

    def meta
      @response_hash['meta'] if @response_hash['meta']
    end

    def objects
      @objects ||= build_entities if @response_hash['entities']
      @objects ||= build_other_types unless @response_hash['entities']
      @objects
    end

    private

      def build_entities
        @response_hash['entities'].collect(&:flatten).collect do |object_type, object_attributes|
          entity_class('Entity', object_type).new(object_attributes)
        end
      end

      def build_other_types
        objects_type, objects = @response_hash.first
        objects.collect do |object_attributes|
          entity_class(objects_type, objects_type).new(object_attributes)
        end
      end
      
      def entity_class(module_type, object_type)
        return "GlobalRegistryModels::#{ module_type.classify }::#{ object_type.classify }".constantize 
      end
  end
end
