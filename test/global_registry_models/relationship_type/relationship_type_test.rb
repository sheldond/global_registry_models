require 'test_helper'

class GlobalRegistryModelsRelationshipTypeRelationshipTypeTest < Minitest::Test

  def test_new
    relationship_type_params={"id" => "A22JJ6K","relationship1" => {
          "entity_type" => "person",
          "relationship_name"=> "father"},
          "relationship2" =>
          {"entity_type" => "person",
          "relationship_name" => "son"}
        }
    relationship_type = GlobalRegistryModels::RelationshipType::RelationshipType.new(relationship_type_params)
    assert_instance_of GlobalRegistryModels::RelationshipType::RelationshipType, relationship_type
    assert_equal "A22JJ6K", relationship_type.id
    assert_equal "person", relationship_type.involved_types.first.entity_type
    assert_equal "son", relationship_type.involved_types.last.relationship_name
  end

end
