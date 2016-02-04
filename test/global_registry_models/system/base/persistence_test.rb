require 'test_helper'

class GlobalRegistryModelsSystemBasePersistenceTest < Minitest::Test

  def test_class_create_bang
    GlobalRegistryModels::System::System.create!(name: "system name", permalink: "test.com", root: false)
    assert_requested :post, 'https://test-api.global-registry.org/systems'
  end

  def test_class_create_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::System::System.create!({})
    end
    assert_not_requested :post, 'https://test-api.global-registry.org/systems'
  end

  def test_class_update_bang
    system = GlobalRegistryModels::System::System.update!('0000-0000-0000-0001', name: "system name", permalink: "test.com", root: false)
    assert_instance_of GlobalRegistryModels::System::System, system
    assert_equal '0000-0000-0000-0001', system.id
    assert_requested :put, 'https://test-api.global-registry.org/systems/0000-0000-0000-0001', body: '{"system":{"name":"system name","permalink":"test.com","root":false,"client_integration_id":null}}'
  end

  def test_class_update_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::System::System.update!('0000-0000-0000-0001', {})
    end
    assert_not_requested :put, "https://test-api.global-registry.org/relationship_types/0000-0000-0000-0001"
  end

end


