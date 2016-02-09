module GlobalRegistryModels
  module Subscription
    class Subscription < Base
      attribute :id, String
      attribute :entity_type_id, String
      attribute :endpoint, String
      attribute :format, String

      validates_presence_of :entity_type_id, :endpoint

      def self.identifying_attributes
        [:id, :entity_type_id]
      end

    end
  end
end
