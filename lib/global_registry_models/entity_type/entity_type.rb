module GlobalRegistryModels
  module EntityType
    class EntityType < Base
      attribute :id, String
      attribute :name, String
      attribute :description, Boolean
      attribute :is_editable, Boolean


      def initialize(id:, name: nil, is_editable: nil, description: nil, fields: nil)
        @id=id
        @name=name
        @is_editable=is_editable
        @description=description
        create_fields fields if fields
      end

      def fields
        @fields
      end

      private

      def create_fields fields
        @fields=[]
        fields.collect do |field|
          @fields << Field.new(field)
        end
      end

    end
  end
end
