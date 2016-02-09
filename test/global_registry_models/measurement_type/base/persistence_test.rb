require 'test_helper'

class GlobalRegistryModelsMeasurementTypeBasePersistenceTest < Minitest::Test
  def test_class_create_bang
    measurement_type = GlobalRegistryModels::MeasurementType::MeasurementType.create!(name: "New Staff", perm_link: "LMI", frequency:"1", unit:"people", description: "A description", related_entity_type_id:"A009W234XXT")
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
    assert GlobalRegistryModels::MeasurementType::MeasurementType.create(id: 'trying-to-update-id', name: "New Staff", frequency:"1", unit:"people", perm_link: "LMI", related_entity_type_id:"A009W234XXT", description: "A description")
    assert_requested :post, 'https://test-api.global-registry.org/measurement_types', body: '{"measurement_type":{"name":"new_staff","frequency":"1","unit":"people","perm_link":"LMI","related_entity_type_id":"A009W234XXT","description":"A description"}}'
  end


  def test_class_update_bang
    measurement_type = GlobalRegistryModels::MeasurementType::MeasurementType.update!('0000-0000-0000-0001', name: "New Staff", frequency:"1", unit:"people", perm_link: "LMI", related_entity_type_id:"A009W234XXT", description: "A description")
    assert_instance_of GlobalRegistryModels::MeasurementType::MeasurementType, measurement_type
    assert_equal '0000-0000-0000-0001', measurement_type.id
    assert_requested :put, 'https://test-api.global-registry.org/measurement_types/0000-0000-0000-0001', body: '{"measurement_type":{"name":"new_staff","frequency":"1","unit":"people","perm_link":"LMI","related_entity_type_id":"A009W234XXT","description":"A description"}}'
  end

  def test_class_update_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::MeasurementType::MeasurementType.update!('0000-0000-0000-0001', {})
    end
    assert_not_requested :put, "https://test-api.global-registry.org/measurement_types/0000-0000-0000-0001"
  end

   def test_class_update_only_updates_writeable_attributes
    assert GlobalRegistryModels::MeasurementType::MeasurementType.update('0000-0000-0000-0001', {id: 'trying-to-update-id', entity_type1_id: '0000-1212', frequency:"1", unit:"people", name: "New Staff", related_entity_type_id:"A009W234XXT", perm_link: "LMI", description: "A description"})
    assert_requested :put, 'https://test-api.global-registry.org/measurement_types/0000-0000-0000-0001', body: '{"measurement_type":{"frequency":"1","unit":"people","name":"new_staff","related_entity_type_id":"A009W234XXT","perm_link":"LMI","description":"A description"}}'
  end
end


