require 'test_helper'

class GlobalRegistryModelsResponseParserTest < Minitest::Test

  def test_new
    response = GlobalRegistryModels::ResponseParser.new entity_test_response
    assert_instance_of GlobalRegistryModels::ResponseParser, response
  end

  def test_meta
    response = GlobalRegistryModels::ResponseParser.new entity_test_response
    assert_instance_of Hash, response.meta
    assert_equal true, response.meta['next_page']
    assert_equal 2, response.meta['to']
    assert_equal 1, response.meta['from']
    assert_equal 1, response.meta['page']
  end

  def test_entities
    response = GlobalRegistryModels::ResponseParser.new entity_test_response
    assert_instance_of Array, response.objects
    assert_equal 2, response.objects.size
    response.objects.each do |entity|
      assert_instance_of GlobalRegistryModels::Entity::Test, entity
    end
    assert_equal '0000-0000-0000-0001', response.objects.first.id
    assert_equal '+1234567890', response.objects.first.phone
    assert_equal 'Mr. Test', response.objects.first.name
  end

  def test_entity_types
    response = GlobalRegistryModels::ResponseParser.new entity_type_test_response
    assert_instance_of Array, response.objects
    assert_equal 3, response.objects.size
    response.objects.each do |entity_type|
      assert_instance_of GlobalRegistryModels::EntityType::EntityType, entity_type
    end
    assert_equal "e9b8aaf0-1994-11e5-a76d-12c37bb2d521", response.objects.first.id
  end

  private

    def entity_test_response
      GlobalRegistry::Entity.get entity_type: 'test'
    end

    def entity_type_test_response
      GlobalRegistry::EntityType.get field_type: 'entity'
    end

end
