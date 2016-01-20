module GlobalRegistryModels
  module EntityType
    class Field < Base
      attribute :id, String
      attribute :name, String
      attribute :parent_id, String
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
