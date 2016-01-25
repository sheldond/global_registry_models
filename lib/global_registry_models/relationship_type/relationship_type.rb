module GlobalRegistryModels
  module RelationshipType
    class RelationshipType < Base
      attribute :id, String

      def initialize(params = {})
        super(params)
        create_involved_types([params["relationship1"],params["relationship2"]]) if params["relationship1"] && params["relationship2"]
      end

      def involved_types
        @involved_types
      end

      private

      def create_involved_types relationships
        @involved_types=[]
        relationships.each do |relationship|
          @involved_types << InvolvedType.new(relationship)
        end
      end

    end
  end
end
