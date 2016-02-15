module GlobalRegistryModels
  module APIOperations
     module Search
      extend ActiveSupport::Concern

      module ClassMethods

        def search(filters: nil, page: nil, per_page: nil, order: nil, fields: nil, ruleset: nil, limit: nil, offset: nil)
          #params = search_params(filters, name, page, per_page, order, fields, ruleset)
          
          params = search_params.merge({ 
            page: page,
            per_page: per_page,
            order: order,
            fields: fields,
            ruleset: ruleset
          }).delete_if { |_, v| v.blank? }

          params = clean_params(filters, params)
          response = GlobalRegistryModels::ResponseParser.new(global_registry_resource.get(params))
          Collection.new meta: response.meta, list: response.objects 
          
        end

        def clean_params( filters, params )
          filters.try(:reject!) { |_, v| v.blank? }
          if filters.present?
            # We need to generate a hash like this: { 'filters[name]' => 'name query', 'filters[attribute][nested_attribute]' => 'nested_attribute query' }
            # It just so happens we can use CGI::parse to do it.
            filter_params_hash = CGI::parse({ filters: filters }.to_query)
            filter_params_hash.each { |k, v| filter_params_hash[k] = v.first if v.is_a?(Array) } # CGI::parse returns values as arrays, we just want string values

            params.merge! filter_params_hash
          end

          params
        end

      end

    end
  end
end
