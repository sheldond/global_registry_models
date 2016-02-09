require 'test_helper'

class GlobalRegistryModelsSystemBaseResetAccessTokenTest < Minitest::Test

  def test_reset_access_token
    system = GlobalRegistryModels::System::System.new id: '0000-0000-0000-0001'
    updated_system = system.reset_access_token
    assert_instance_of GlobalRegistryModels::System::System, updated_system
    assert_requested :post, 'https://test-api.global-registry.org/systems/reset_access_token?id=0000-0000-0000-0001'
  end

end