require 'test_helper'

class GlobalRegistryModelsRelationshipTypeBasePersistenceTest < Minitest::Test
  def test_class_create_bang
    relationship_type = GlobalRegistryModels::RelationshipType::RelationshipType.create!(entity_type1_id: '0000-1212', relationship1: 'person', entity_type2_id: '0000-1212', relationship2: 'person', client_integration_id: 1)
    assert_instance_of GlobalRegistryModels::RelationshipType::RelationshipType, relationship_type
    assert_equal '0000-0000-0000-0001', relationship_type.id
    assert_requested :post, 'https://test-api.global-registry.org/relationship_types'
  end

  def test_class_create_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::RelationshipType::RelationshipType.create!({})
    end
    assert_not_requested :post, 'https://test-api.global-registry.org/relationship_types'
  end

  def test_class_create_only_updates_writeable_attributes
    assert GlobalRegistryModels::RelationshipType::RelationshipType.create(id: 'trying-to-update-id', entity_type1_id: '0000-1212', relationship1: 'person', entity_type2_id: '0000-1212', relationship2: 'person', client_integration_id: 1)
    assert_requested :post, 'https://test-api.global-registry.org/relationship_types', body: '{"relationship_type":{"entity_type1_id":"0000-1212","relationship1":"person","entity_type2_id":"0000-1212","relationship2":"person","client_integration_id":"1"}}'
  end


  def test_class_update_bang
    relationship_type = GlobalRegistryModels::RelationshipType::RelationshipType.update!('0000-0000-0000-0001', entity_type1_id: '0000-1212', relationship1: 'person', entity_type2_id: '0000-1212', relationship2: 'person', client_integration_id: 1)
    assert_instance_of GlobalRegistryModels::RelationshipType::RelationshipType, relationship_type
    assert_equal '0000-0000-0000-0001', relationship_type.id
    assert_requested :put, 'https://test-api.global-registry.org/relationship_types/0000-0000-0000-0001', body: '{"relationship_type":{"entity_type1_id":"0000-1212","relationship1":"person","entity_type2_id":"0000-1212","relationship2":"person","client_integration_id":"1"}}'
  end

  def test_class_update_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::RelationshipType::RelationshipType.update!('0000-0000-0000-0001', {})
    end
    assert_not_requested :put, "https://test-api.global-registry.org/relationship_types/0000-0000-0000-0001"
  end

   def test_class_update_only_updates_writeable_attributes
    assert GlobalRegistryModels::RelationshipType::RelationshipType.update('0000-0000-0000-0001', {id: 'trying-to-update-id', entity_type1_id: '0000-1212', relationship1: 'person', entity_type2_id: '0000-1212', relationship2: 'person', client_integration_id: 1})
    assert_requested :put, 'https://test-api.global-registry.org/relationship_types/0000-0000-0000-0001', body: '{"relationship_type":{"entity_type1_id":"0000-1212","relationship1":"person","entity_type2_id":"0000-1212","relationship2":"person","client_integration_id":"1"}}'
  end

end

