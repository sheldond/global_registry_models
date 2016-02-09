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
    assert_equal "test system", subscription.name
    assert_equal "Mr test", subscription.contact_name
    assert_equal "test.com", subscription.permalink
  end

end
