require 'test_helper'

class GlobalRegistryModelsResponseParserTest < Minitest::Test

  def test_new
    response = GlobalRegistryModels::ResponseParser.new test_response
    assert_instance_of GlobalRegistryModels::ResponseParser, response
  end

  def test_meta
    response = GlobalRegistryModels::ResponseParser.new test_response
    assert_instance_of Hash, response.meta
    assert_equal true, response.meta['next_page']
    assert_equal 2, response.meta['to']
    assert_equal 1, response.meta['from']
    assert_equal 1, response.meta['page']
  end

  def test_entities
    response = GlobalRegistryModels::ResponseParser.new test_response
    assert_instance_of Array, response.entities
    assert_equal 2, response.entities.size
    response.entities.each do |entity|
      assert_instance_of GlobalRegistryModels::Entity::Test, entity
    end
    assert_equal '0000-0000-0000-0001', response.entities.first.id
    assert_equal '+1234567890', response.entities.first.phone
    assert_equal 'Mr. Test', response.entities.first.name
  end

  private

    def test_response
      GlobalRegistry::Entity.get entity_type: 'test'
    end

end
