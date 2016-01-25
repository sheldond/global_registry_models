require 'test_helper'

class GlobalRegistryModelsRelationshipTypeInvolvedTypeTest < Minitest::Test

  def test_new
    involved_type = GlobalRegistryModels::RelationshipType::InvolvedType.new({
          "entity_type" => "person",
          "relationship_name"=> "father"
        })
    assert_instance_of GlobalRegistryModels::RelationshipType::InvolvedType, involved_type
    assert_equal involved_type.entity_type, "person"
    assert_equal involved_type.relationship_name, "father"
  end

end
