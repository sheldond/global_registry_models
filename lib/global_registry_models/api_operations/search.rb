module GlobalRegistryModels
  module APIHelpers
    extend ActiveSupport::Concern
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
