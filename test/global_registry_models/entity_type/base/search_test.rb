require 'test_helper'

class GlobalRegistryModelsEntityTypesBaseSearchTest < Minitest::Test

  def test_search_blank
    found = GlobalRegistryModels::EntityType::Test.search
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::EntityType::EntityType, found.first
    assert_requested :get, 'https://test-api.global-registry.org/entity_types?field_type=entity'
  end

  def test_search_with_basic_filters
    found = GlobalRegistryModels::EntityType::Test.search(filters: { per_page: 15, page: 3 })
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::EntityType::EntityType, found.first
    assert_requested :get, 'https://test-api.global-registry.org/entity_types?field_type=entity&filters%5Bpage%5D=3&filters%5Bper_page%5D=15'
  end

end
