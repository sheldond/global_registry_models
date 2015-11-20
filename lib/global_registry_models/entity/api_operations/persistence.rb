module GlobalRegistryModels
  module Entity
    module APIOperations
      module Persistence
        extend ActiveSupport::Concern

        module ClassMethods
          def create!(attributes)
            entity = new(attributes.with_indifferent_access.except(:id))
            if entity.valid?
              attribute_keys_to_create = attributes.keys.collect(&:to_sym) & writeable_attributes
              create_attributes = entity.attributes.with_indifferent_access.slice(*attribute_keys_to_create)
              new GlobalRegistry::Entity.post({ entity: { name => create_attributes }})['entity'][name]
            else
              raise GlobalRegistryModels::Entity::RecordInvalid.new
            end
          end

          def create(attributes)
            create! attributes
          rescue GlobalRegistryModels::Entity::RecordInvalid
            false
          end

          def update!(id, attributes)
            entity = new(attributes)
            if entity.valid?
              attribute_keys_to_update = (attributes.keys.collect(&:to_sym) << :client_integration_id) & writeable_attributes
              update_attributes = entity.attributes.with_indifferent_access.slice(*attribute_keys_to_update)
              new GlobalRegistry::Entity.put(id, { entity: { name => update_attributes }})['entity'][name]
            else
              raise GlobalRegistryModels::Entity::RecordInvalid.new
            end
          end

          def update(id, attributes)
            update! id, attributes
          rescue GlobalRegistryModels::Entity::RecordInvalid
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
end

