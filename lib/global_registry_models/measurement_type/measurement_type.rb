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

      def self.identifying_attributes
        [:name, :description, :frequency, :perm_link, :unit]
      end


    end
  end
end
