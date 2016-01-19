module GlobalRegistryModels
  module EntityType
    class Field < Base
      attribute :id, String
      attribute :name, String
      attribute :parent_id, String
      attribute :description, String
      attribute :is_editable, Boolean
      attribute :field_type, String


      def initialize(id: nil, name: nil, description: nil, field_type: nil, is_editable: nil, fields: nil)
        @id=id
        @name=name
        @field_type=field_type
        @is_editable=is_editable
        @description=description
        create_children fields if fields
      end

      def fields
        @fields
      end

    private

      def create_children fields
        @fields=[]
        fields.collect do |field|
          @fields << Field.new(field)
        end
      end

    end
  end
end
