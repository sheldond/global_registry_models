module GlobalRegistryModels
  module Entity
    module APIOperations
      module Search
        extend ActiveSupport::Concern

        module ClassMethods
          include GlobalRegistryModels::APIHelpers

          def search(filters: nil, page: nil, per_page: nil, order: nil, fields: nil, ruleset: nil)
            #params = search_params(filters, name, page, per_page, order, fields, ruleset)
            params = {
              entity_type: name,
              page: page,
              per_page: per_page,
              order: order,
              fields: fields,
              ruleset: ruleset
            }.delete_if { |_, v| v.blank? }

            params = clean_params(filters, params)

            response = GlobalRegistryModels::ResponseParser.new(GlobalRegistry::Entity.get(params))
            Collection.new meta: response.meta, list: response.entities
          end

        end
      end
    end
  end
end
