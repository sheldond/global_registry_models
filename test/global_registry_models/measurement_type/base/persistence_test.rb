require 'test_helper'

class GlobalRegistryModelsMeasurementTypeBasePersistenceTest < Minitest::Test
  def test_class_create_bang
    measurement_type = GlobalRegistryModels::MeasurementType::MeasurementType.create!(name: "New Staff", perm_link: "LMI", description: "A description", client_integration_id: 1)
    assert_instance_of GlobalRegistryModels::MeasurementType::MeasurementType, measurement_type
    assert_equal '0000-0000-0000-0001', measurement_type.id
    assert_requested :post, 'https://test-api.global-registry.org/measurement_types'
  end

  def test_class_create_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::MeasurementType::MeasurementType.create!({})
    end
    assert_not_requested :post, 'https://test-api.global-registry.org/measurement_types'
  end

  def test_class_create_only_updates_writeable_attributes
    assert GlobalRegistryModels::MeasurementType::MeasurementType.create(id: 'trying-to-update-id', name: "New Staff", perm_link: "LMI", description: "A description", client_integration_id: 1)
    assert_requested :post, 'https://test-api.global-registry.org/measurement_types', body: '{"measurement_type":{"name":"New Staff","perm_link":"LMI","description":"A description","client_integration_id":"1"}}'
  end


  def test_class_update_bang
    measurement_type = GlobalRegistryModels::MeasurementType::MeasurementType.update!('0000-0000-0000-0001', name: "New Staff", perm_link: "LMI", description: "A description", client_integration_id: 1)
    assert_instance_of GlobalRegistryModels::MeasurementType::MeasurementType, measurement_type
    assert_equal '0000-0000-0000-0001', measurement_type.id
    assert_requested :put, 'https://test-api.global-registry.org/measurement_types/0000-0000-0000-0001', body: '{"measurement_type":{"name":"New Staff","perm_link":"LMI","description":"A description","client_integration_id":"1"}}'
  end

  def test_class_update_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::MeasurementType::MeasurementType.update!('0000-0000-0000-0001', {})
    end
    assert_not_requested :put, "https://test-api.global-registry.org/measurement_types/0000-0000-0000-0001"
  end

   def test_class_update_only_updates_writeable_attributes
    assert GlobalRegistryModels::MeasurementType::MeasurementType.update('0000-0000-0000-0001', {id: 'trying-to-update-id', entity_type1_id: '0000-1212', name: "New Staff", perm_link: "LMI", description: "A description", client_integration_id: 1})
    assert_requested :put, 'https://test-api.global-registry.org/measurement_types/0000-0000-0000-0001', body: '{"measurement_type":{"name":"New Staff","perm_link":"LMI","description":"A description","client_integration_id":"1"}}'
  end
end


