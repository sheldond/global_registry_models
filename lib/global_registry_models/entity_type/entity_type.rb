module GlobalRegistryModels
  module EntityType
    class EntityType < Base
      attribute :id, String
      attribute :name, String
      attribute :description, Boolean
      attribute :is_editable, Boolean
      attribute :field_type, String
      attribute :data_visibility, String
      attribute :enum_values, Array
      attribute :unique_value, Boolean

      def initialize(params = {})
        super(params)
        create_fields(params["fields"]) if params["fields"]
        create_relationships(params["relationships"]) if params["relationships"]
      end

      def fields
        @fields
      end

      def relationships
        @relationships
      end

      def self.identifying_attributes
        [:name, :description, :is_editable, :field_type, :data_visibility]
      end

      private

      def create_fields fields
        @fields=[]
        fields.collect do |field|
          @fields << Field.new(field)
        end
      end

      def create_relationships relationships
        @relationships=[]
        relationships.collect do |relationship|
          @relationships << GlobalRegistryModels::RelationshipType::RelationshipType.new(relationship["relationship_type"])
        end
      end

    end
  end
end
