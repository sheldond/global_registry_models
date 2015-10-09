require 'test_helper'

class GlobalRegistryModelsEntityBaseTest < Minitest::Test

  def test_title
    assert_equal 'Test', GlobalRegistryModels::Entity::Test.title
    assert_equal 'Tests', GlobalRegistryModels::Entity::Test.title.pluralize
  end

  def test_identifying_attributes
    assert_equal [:id], GlobalRegistryModels::Entity::Test.identifying_attributes
  end

  def test_filterable_attributes
    assert_equal [:id, :client_integration_id, :phone, :name], GlobalRegistryModels::Entity::Test.filterable_attributes
  end

  def test_initialize_ignores_non_attribute_keys
    tester = GlobalRegistryModels::Entity::Test.new name: 'Mr. Test', my_favourite_colour: 'blue'
    assert ({ id: nil, client_integration_id: nil, name: 'Mr. Test', phone: nil } == tester.attributes)
  end

  def test_attribute_names
    assert_equal [:id, :client_integration_id, :phone, :name], GlobalRegistryModels::Entity::Test.attribute_names
  end

  def test_attributes
    tester = GlobalRegistryModels::Entity::Test.new name: 'Mr. Test', phone: '1-800-TEST-MEYO'
    assert ({ id: nil, client_integration_id: nil, name: 'Mr. Test', phone: '1-800-TEST-MEYO' } == tester.attributes)
    tester.name = 'Count Test'
    assert ({ id: nil, client_integration_id: nil, name: 'Count Test', phone: '1-800-TEST-MEYO' } == tester.attributes)
  end

  def test_attributes=
    tester = GlobalRegistryModels::Entity::Test.new name: 'Mr. Test', phone: '1-800-TEST-MEYO'
    assert ({ id: nil, client_integration_id: nil, name: 'Mr. Test', phone: '1-800-TEST-MEYO' } == tester.attributes)
    tester.attributes = { name: 'Ms. Test', phone: '123.4567' }
    assert ({ id: nil, client_integration_id: nil, name: 'Ms. Test', phone: '123.4567' } == tester.attributes)
    tester.attributes = {}
    assert ({ id: nil, client_integration_id: nil, name: 'Ms. Test', phone: '123.4567' } == tester.attributes)
    tester.attributes = { name: 'Sir Test' }
    assert ({ id: nil, client_integration_id: nil, name: 'Sir Test', phone: '123.4567' } == tester.attributes)
  end

  def test_name
    assert_equal 'test', GlobalRegistryModels::Entity::Test.name
  end

  def test_create
    entity = GlobalRegistryModels::Entity::Test.create name: 'Mr. Test', phone: '1800TEST', client_integration_id: '1'
    assert_instance_of GlobalRegistryModels::Entity::Test, entity
    assert_equal '0000-0000-0000-0001', entity.id
    assert_requested :post, 'https://test-api.global-registry.org/entities'
  end

  def test_create_when_invalid
    assert !GlobalRegistryModels::Entity::Test.create({})
    assert_not_requested :post, "https://test-api.global-registry.org/entities"
  end

  def test_update
    entity = GlobalRegistryModels::Entity::Test.update '0000-0000-0000-0001', name: 'Mr. Test', phone: '1800TEST', client_integration_id: '1'
    assert_instance_of GlobalRegistryModels::Entity::Test, entity
    assert_equal '0000-0000-0000-0001', entity.id
    assert_requested :put, 'https://test-api.global-registry.org/entities/0000-0000-0000-0001'
  end

  def test_update_when_invalid
    assert !GlobalRegistryModels::Entity::Test.update('0000-0000-0000-0001', {})
    assert_not_requested :put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001"
  end

  def test_save_without_id
    entity = GlobalRegistryModels::Entity::Test.new name: 'Mr. Test', phone: '1800TEST', client_integration_id: '1'
    assert entity.save
    assert ({ id: '0000-0000-0000-0001', name: 'Mr. Test', phone: '1800TEST', client_integration_id: '1' } == entity.attributes)
    assert_requested :post, 'https://test-api.global-registry.org/entities'
  end

  def test_save_with_id
    entity = GlobalRegistryModels::Entity::Test.find '0000-0000-0000-0001'
    entity.phone = '1800TEST'
    entity.client_integration_id = '1'
    assert entity.save
    assert ({ id: '0000-0000-0000-0001', name: 'Mr. Test', phone: '1800TEST', client_integration_id: '1' } == entity.attributes)
    assert_requested :put, 'https://test-api.global-registry.org/entities/0000-0000-0000-0001'
  end

  def test_save_when_invalid
    entity = GlobalRegistryModels::Entity::Test.new name: 'Test', id: nil
    assert !entity.save
    assert_not_requested :put, 'https://test-api.global-registry.org/entities/0000-0000-0000-0001'
  end

end
