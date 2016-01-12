module GlobalRegistryModels
  module Entity
    class EntityType < Base
      attribute :id, String
      attribute :name, String
      attribute :parent_id
      attribute :description, Boolean

      def initialize(id:, name:, parent_id:, is_editable:, description:, fields:)
        fields.collect do |entity_type|
          EntityType.new(entity_type)
        end
      end

      def to_s
        name
      end
    end
  end
end
