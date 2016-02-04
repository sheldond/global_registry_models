module GlobalRegistryModels
  module System
    class System < Base
      attribute :name, String
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :contact_name, String
      attribute :contact_email, String
      attribute :permalink, String
      attribute :root, Boolean
      attribute :access_token, String
      attribute :trusted_ips, Array

      validates_presence_of :name

      def self.identifying_attributes
        [:id, :name, :contact_name, :contact_email, :permalink]
      end

      def self.identifying_root_attributes
        [:id, :name, :contact_name, :contact_email, :permalink, :root, :access_token, :trusted_ips]
      end

    end
  end
end
