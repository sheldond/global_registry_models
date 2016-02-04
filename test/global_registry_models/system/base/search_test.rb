require 'test_helper'

class GlobalRegistryModelsSystemBaseSearchTest < Minitest::Test

  def test_search_blank
    found = GlobalRegistryModels::System::System.search
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::System::System, found.first
    assert_requested :get, 'https://test-api.global-registry.org/systems'
  end

end
