module GlobalRegistryModels
  module MeasurementType
    class MeasurementType < Base
      attribute :id, String
      attribute :name, String
      attribute :description, String
      attribute :related_entity_type_id, String
      attribute :frequency, String
      attribute :perm_link, String
      attribute :unit, String

      validates_presence_of :frequency, :unit, :perm_link, :related_entity_type_id, :name
      after_validation :underscore_name

      def self.identifying_attributes
        [:related_entity_type_id, :name, :description, :frequency, :perm_link, :unit]
      end

    end
  end
end
