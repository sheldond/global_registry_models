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
