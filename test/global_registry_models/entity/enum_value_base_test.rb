require 'test_helper'

# A Test model
module GlobalRegistryModels
  module Entity
    class TestEnumValue < EnumValueBase
    end
  end
end

class GlobalRegistryModelsEntityEnumValueBaseTest < Minitest::Test

  def test_initialize
    enum_value = GlobalRegistryModels::Entity::TestEnumValue.new('TheValue')
    assert_equal 'TheValue', enum_value.enum_value
  end

  def test_identifying_attributes
    assert GlobalRegistryModels::Entity::TestEnumValue.identifying_attributes.is_a?(Array)
  end

  def test_to_s
    assert_equal 'Testing123', GlobalRegistryModels::Entity::TestEnumValue.new('Testing123').to_s
  end

end
