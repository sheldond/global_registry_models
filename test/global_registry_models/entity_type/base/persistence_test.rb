require 'test_helper'

class GlobalRegistryModelsEntityTypeBasePersistenceTest < Minitest::Test

   def test_class_create_bang
    entity_type = GlobalRegistryModels::EntityType::EntityType.create!(name: 'Entity Type 1', description: 'a great entity type', field_type: 'string', client_integration_id: '1')
    assert_instance_of GlobalRegistryModels::EntityType::EntityType, entity_type
    assert_equal '0000-0000-0000-0001', entity_type.id
    assert_requested :post, 'https://test-api.global-registry.org/entity_types'
  end

  def test_class_create_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::EntityType::EntityType.create!({})
    end
    assert_not_requested :post, 'https://test-api.global-registry.org/entity_types'
  end

  def test_class_create_only_updates_writeable_attributes
    assert GlobalRegistryModels::EntityType::EntityType.create(id: 'trying-to-update-id', client_integration_id: 1, is_active: '0')
    assert_requested :post, 'https://test-api.global-registry.org/entity_types', body: '{"entity":{"test":{"client_integration_id":"1","is_active":false}}}'
  end


  def test_class_update_bang
    entity_type = GlobalRegistryModels::Entity::Test.update!('0000-0000-0000-0001', name: 'Entity Type 1', description: 'a great entity type', field_type: 'string', client_integration_id: '1')
    assert_instance_of GlobalRegistryModels::EntityType::EntityType, entity_type
    assert_equal '0000-0000-0000-0001', entity_type.id
    assert_requested :put, 'https://test-api.global-registry.org/entity_types/0000-0000-0000-0001'
  end

  def test_class_update_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::EntityType::EntityType.update!('0000-0000-0000-0001', {})
    end
    assert_not_requested :put, "https://test-api.global-registry.org/entity_types/0000-0000-0000-0001"
  end


end

