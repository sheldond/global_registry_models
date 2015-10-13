module GlobalRegistryModels
  module Entity
    module APIOperations
      module Persistence
        extend ActiveSupport::Concern

        module ClassMethods
          def create(attributes)
            attributes = attributes.with_indifferent_access.except(:id)
            if new(attributes).valid?
              new GlobalRegistry::Entity.post({ entity: { name => attributes }})['entity'][name]
            else
              false
            end
          end

          def update!(id, attributes)
            attributes = attributes.with_indifferent_access.except(:id)
            if new(attributes).valid?
              new GlobalRegistry::Entity.put(id, { entity: { name => attributes }})['entity'][name]
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

        def update!(attributes)
          self.class.update! self.id, { client_integration_id: self.client_integration_id }.merge(attributes)
        end

      end
    end
  end
end

