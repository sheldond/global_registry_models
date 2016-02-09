require 'test_helper'

class GlobalRegistryModelsSubscriptionBaseDeleteTest < Minitest::Test

  def test_class_create_bang
    GlobalRegistryModels::Subscription::Subscription.delete("672fbfc0-e0e6-11e3-8f08-12725f8f377c")
    assert_requested :delete, 'https://test-api.global-registry.org/subscriptions/672fbfc0-e0e6-11e3-8f08-12725f8f377c'
  end

end

