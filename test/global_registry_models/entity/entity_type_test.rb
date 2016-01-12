require 'test_helper'

class GlobalRegistryModelsEntityEntityTypeTest < Minitest::Test

  def test_new
    entity_type = GlobalRegistryModels::Entity::EntityType.new(id: "A22JJ6K", name: "Area", fields: [{
          "id": "a740308a-7412-11e4-92c1-8f55e068e2dd",
          "name": "first_field",
          "description": "Your official given name.",
          "field_type": "string",
          "is_editable": true
        }])
    assert_instance_of GlobalRegistryModels::Entity::EntityType, entity_type
    assert_instance_of GlobalRegistryModels::Entity::Field, entity_type.fields.first
    assert_equal entity_type.fields.first.name, "first_field"
    assert_equal entity_type.fields.first.name, "first_field"
  end

end
