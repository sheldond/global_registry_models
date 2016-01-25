require 'test_helper'

class GlobalRegistryModelsRelationshipTypesBaseSearchTest < Minitest::Test

  def test_search_blank
    found = GlobalRegistryModels::RelationshipType::RelationshipType.search
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::RelationshipType::RelationshipType, found.first
    assert_requested :get, 'https://test-api.global-registry.org/relationship_types'

  end

  def test_search_with_basic_filters
    found = GlobalRegistryModels::RelationshipType::RelationshipType.search(filters: { per_page: 15, page: 3 })
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::RelationshipType::RelationshipType, found.first
    assert_requested :get, 'https://test-api.global-registry.org/relationship_types?&filters%5Bpage%5D=3&filters%5Bper_page%5D=15'
  end

end
