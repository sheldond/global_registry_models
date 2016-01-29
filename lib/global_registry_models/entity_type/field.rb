module GlobalRegistryModels
  module EntityType
    class Field < Base
      attribute :id, String
      attribute :name, String
      attribute :description, String
      attribute :is_editable, Boolean
      attribute :field_type, String

      def initialize(params = {})
        super(params)
        create_children(params["fields"]) if params["fields"]
      end

      def fields
        @fields
      end

      def self.identifying_attributes
        [:name, :description, :is_editable, :field_type, :data_visibility]
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
