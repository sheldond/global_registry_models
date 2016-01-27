module GlobalRegistryModels
  module APIOperations
    module Persistence
      extend ActiveSupport::Concern

      module ClassMethods

        def is_entity?
          global_registry_resource == GlobalRegistry::Entity 
        end

        def ressource_type
           is_entity? ? 'entity' : global_registry_resource.to_s.demodulize.underscore
        end

        def attributes_hash(attributes)
          is_entity? ? {ressource_type.to_sym => { name => attributes }} : { global_registry_resource => attributes }
        end
        def create!(attributes)
          object = new(attributes.with_indifferent_access.except(:id))
          if object.valid?
            attribute_keys_to_create = attributes.keys.collect(&:to_sym) & writeable_attributes
            create_attributes = object.attributes.with_indifferent_access.slice(*attribute_keys_to_create)
            response_hash = global_registry_resource.post(attributes_hash(create_attributes))[ressource_type]
            if is_entity?
              (new response_hash[name]) 
            else
              (new response_hash)
            end
          else
            raise GlobalRegistryModels::RecordInvalid.new
          end
        end

        def create(attributes)
          create! attributes
          rescue GlobalRegistryModels::RecordInvalid
          false
        end

        def update!(id, attributes)
          entity = new(attributes)
          if entity.valid?
            attribute_keys_to_update = (attributes.keys.collect(&:to_sym) << :client_integration_id) & writeable_attributes
            update_attributes = entity.attributes.with_indifferent_access.slice(*attribute_keys_to_update)
            response_hash = global_registry_resource.put(id, attributes_hash(update_attributes))[ressource_type]
            is_entity? ? (new response_hash[name]) : (new response_hash)
          else
            raise GlobalRegistryModels::RecordInvalid.new
          end
        end

        def update(id, attributes)
          update! id, attributes
        rescue GlobalRegistryModels::RecordInvalid
          false
        end
      end

      def save
        if valid?
          result = id.present? ? self.class.update(id, attributes) : self.class.create(attributes)
          result ? self.id = result.id : false
        else
          false
        end
      end

      def update!(update_attributes)
        self.class.update! id, { client_integration_id: client_integration_id }.with_indifferent_access.merge(update_attributes)
      end

      

    end
  end
end

