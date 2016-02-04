require 'test_helper'

class GlobalRegistryModelsSubscriptionBaseSearchTest < Minitest::Test

  def test_search_blank
    found = GlobalRegistryModels::Subscription::Subscription.search
    assert_instance_of GlobalRegistryModels::Collection, found
    assert_instance_of GlobalRegistryModels::Subscription::Subscription, found.first
    assert_requested :get, 'https://test-api.global-registry.org/subscriptions'
  end

end
