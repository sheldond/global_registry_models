require 'test_helper'

class GlobalRegistryModelsSubscriptionBasePersistenceTest < Minitest::Test

  def test_class_create_bang
    GlobalRegistryModels::Subscription::Subscription.create!(entity_type_id: "672fbfc0-e0e6-11e3-8f08-12725f8f377c", endpoint: "test.com")
    assert_requested :post, 'https://test-api.global-registry.org/subscriptions'
  end

  def test_class_create_bang_when_invalid
    assert_raises GlobalRegistryModels::RecordInvalid do
      GlobalRegistryModels::Subscription::Subscription.create!({})
    end
    assert_not_requested :post, 'https://test-api.global-registry.org/subscriptions'
  end

end


