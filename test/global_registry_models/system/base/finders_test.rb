require 'test_helper'

class GlobalRegistryModelsSystemBaseFindersTest < Minitest::Test

  def test_find
    found = GlobalRegistryModels::System::System.find '0000-0000-0000-0001'
    assert_instance_of GlobalRegistryModels::System::System, found
    assert_equal '0000-0000-0000-0001', found.id
    assert_requested :get, 'https://test-api.global-registry.org/systems/0000-0000-0000-0001'
  end

end
