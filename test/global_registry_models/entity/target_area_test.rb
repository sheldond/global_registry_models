require 'test_helper'

class GlobalRegistryModelsTargetAreaTest < Minitest::Test

  def test_to_s
    target_area = GlobalRegistryModels::Entity::TargetArea.new(id: '1234-ABCD', name: 'Tester Campus')
    assert_equal 'Tester Campus', target_area.to_s
  end

end
