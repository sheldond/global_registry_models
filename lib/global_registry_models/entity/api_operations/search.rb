module GlobalRegistryModels
  module Entity
    module APIOperations
      module Search
        extend ActiveSupport::Concern

        module ClassMethods
          include GlobalRegistryModels::APIOperations

          def search(filters: nil, page: nil, per_page: nil, order: nil, fields: nil, ruleset: nil)
            common_search("Entity", filters, name, page, per_page, order, fields, ruleset)
          end

        end
      end
    end
  end
end
