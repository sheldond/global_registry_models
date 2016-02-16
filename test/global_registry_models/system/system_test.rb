require 'test_helper'

class GlobalRegistryModelsSystemSystemTest < Minitest::Test

  def test_new
   system_params={
      "name": "test system",
      "contact_name": "Mr test",
      "permalink": "test.com"
    }
    system = GlobalRegistryModels::System::System.new(system_params)
    assert_instance_of GlobalRegistryModels::System::System, system
    assert_equal "test system", system.name
    assert_equal "Mr test", system.contact_name
    assert_equal "test.com", system.permalink
  end

  def test_find_current_system
    system = GlobalRegistryModels::System::System.find_current_system
    assert_requested :get, 'https://test-api.global-registry.org/systems/deadbeef-dead-beef-dead-beefdeadbeef'
    assert_instance_of GlobalRegistryModels::System::System, system
    assert_equal "dead beef system", system.name
    assert_equal "Dead Beef", system.contact_name
    assert_equal "dead_beef_test", system.permalink
  end

end
