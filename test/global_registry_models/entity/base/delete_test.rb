require 'test_helper'

class GlobalRegistryModelsEntityBaseDeleteTest < Minitest::Test

  def test_delete
    assert GlobalRegistryModels::Entity::Test.delete '0000-0000-0000-0001'
    assert_requested :delete, 'https://test-api.global-registry.org/entities/0000-0000-0000-0001'
  end

  def test_delete
    entity = GlobalRegistryModels::Entity::Test.find '0000-0000-0000-0001'
    assert entity.delete
    assert_requested :delete, 'https://test-api.global-registry.org/entities/0000-0000-0000-0001'
  end

  def test_delete_without_id
    entity = GlobalRegistryModels::Entity::Test.new name: 'Test', id: nil
    assert !entity.delete
    assert_not_requested :delete, 'https://test-api.global-registry.org/entities/0000-0000-0000-0001'
  end

end

