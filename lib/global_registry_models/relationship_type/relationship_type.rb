module GlobalRegistryModels
  module RelationshipType
    class RelationshipType < Base
      attribute :id, String
      attribute :relationship_entity_type_1, String
      attribute :relationship_name_1, String
      attribute :relationship_entity_type_2, String
      attribute :relationship_name_2, String
      

      def initialize(params = {})
        super(params)
        create_fields(params["fields"]) if params["fields"]
      end

      def fields
        @fields
      end

      def self.identifying_attributes
        [:id, :relationship_entity_type_1, :relationship_name_1, :relationship_entity_type_2, :relationship_name_2]
      end

    end
  end
end
