require 'test_helper'

class GlobalRegistryModelsMeasurementTypesBaseSearchTest < Minitest::Test

  def test_search_blank
    found = GlobalRegistryModels::MeasurementType::MeasurementType.search
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::MeasurementType::MeasurementType, found.first
    assert_requested :get, 'https://test-api.global-registry.org/measurement_types'

  end

  def test_search_with_basic_filters
    found = GlobalRegistryModels::MeasurementType::MeasurementType.search(filters: { per_page: 15, page: 3})
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::MeasurementType::MeasurementType, found.first
    assert_requested :get, 'https://test-api.global-registry.org/measurement_types?&filters%5Bpage%5D=3&filters%5Bper_page%5D=15'
  end

end
