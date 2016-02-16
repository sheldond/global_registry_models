require 'test_helper'

class GlobalRegistryModelsSystemBaseSearchTest < Minitest::Test

  def test_search_blank
    found = GlobalRegistryModels::System::System.search
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::System::System, found.first
    assert_requested :get, 'https://test-api.global-registry.org/systems'
  end

  def test_search_with_page
    found = GlobalRegistryModels::System::System.search(page: 1, per_page: 5)
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_equal 1, found.page
    assert_equal false, found.last_page?
    assert_equal 5, found.count
  end

end
