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
            entity = new(attributes)
            if entity.valid?
              update_attributes = entity.attributes.with_indifferent_access.slice(*attributes.keys).except(:id)
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
          self.class.update! id, attributes.with_indifferent_access.merge(update_attributes)
        end

      end
    end
  end
end

