require 'test_helper'

class GlobalRegistryModelsEntityTypeFieldTest < Minitest::Test

  def test_new
    entity_type = GlobalRegistryModels::EntityType::Field.new(id: "A22JJ6K", name: "Location", field_type: "string", fields: [{
          "id": "a740308a-7412-11e4-92c1-8f55e068e2dd",
          "name": "first_field",
          "description": "Your official given description.",
          "field_type": "string",
          "is_editable": true
        }])
    assert_instance_of GlobalRegistryModels::EntityType::Field, entity_type
    assert_instance_of GlobalRegistryModels::EntityType::Field, entity_type.fields.first
    assert_equal "string", entity_type.fields.first.field_type
    assert_equal true, entity_type.fields.first.is_editable
    assert_equal "Your official given description.", entity_type.fields.first.description
  end

end
