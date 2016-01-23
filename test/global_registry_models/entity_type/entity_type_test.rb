require 'test_helper'

class GlobalRegistryModelsEntityTypeEntityTypeTest < Minitest::Test

  def test_new
    entity_type_params={"id" => "A22JJ6K", "name" => "Area", "fields" => [{
          "id" => "a740308a-7412-11e4-92c1-8f55e068e2dd",
          "name"=> "first_field",
          "description" => "Your official given name.",
          "field_type" => "string",
          "is_editable" => true
        }],
        "relationships" =>
                [{"relationship_type" => {
                  "id" => "7cd27938-d558-11e3-868a-12725f8f377c",
                  "relationship_entity_type_id" => "b4c69f8e-db86-11e3-acf9-12725f8f377c",
                  "relationship1" => {"entity_type" => "person","relationship_name" => "person"},
                  "relationship2" => {"entity_type" => "ministry","relationship_name" => "ministry"}
                  }},
                {"relationship_type" => {
                  "id" => "7cd27938-d558-11e3-868a-12725f8f377c",
                  "relationship_entity_type_id" => "b4c69f8e-db86-11e3-acf9-12725f8f377c",
                  "relationship1" => {"entity_type" => "person","relationship_name" => "person"},
                  "relationship2" => {"entity_type" => "ministry","relationship_name" => "ministry"}
                  }}]
      }
    entity_type = GlobalRegistryModels::EntityType::EntityType.new(entity_type_params)
    assert_instance_of GlobalRegistryModels::EntityType::EntityType, entity_type
    assert_instance_of GlobalRegistryModels::EntityType::Field, entity_type.fields.first
    assert_instance_of GlobalRegistryModels::RelationshipType::RelationshipType, entity_type.relationships.second
    assert_instance_of GlobalRegistryModels::RelationshipType::InvolvedType, entity_type.relationships.second.involved_types.first
    assert_equal entity_type.fields.first.name, "first_field"
    assert_equal entity_type.fields.first.id, "a740308a-7412-11e4-92c1-8f55e068e2dd"
  end

end
