module GlobalRegistryModels
  module APIOperations
     module Search
      extend ActiveSupport::Concern

      module ClassMethods

        def search(filters: nil, page: nil, per_page: nil, order: nil, fields: nil, ruleset: nil)

          if has_meta
            params = search_params.merge({ 
              page: page,
              per_page: per_page,
              order: order,
              fields: fields,
              ruleset: ruleset
            }).delete_if { |_, v| v.blank? }
          else
            page ||= 1
            per_page ||= 25
            offset = per_page.to_i * (page.to_i  - 1)
            params = search_params.merge({ 
              offset: offset,
              limit: per_page
            })
          end

          params = clean_params(filters, params)
          response = GlobalRegistryModels::ResponseParser.new(global_registry_resource.get(params))
          if has_meta
            meta = response.meta
          else
            meta = {
                      "page" => page,
                      "next_page" => next_page?(per_page, response.objects.count),
                      "from" => offset+1,
                      "to" => offset.to_i + per_page
                    }
          end
          Collection.new meta: meta, list: response.objects 
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

        def next_page?(per_page, objects_count)
          per_page == objects_count
        end

      end

    end
  end
end
