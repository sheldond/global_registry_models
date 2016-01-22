require 'test_helper'

class GlobalRegistryModelsMeasurementTypeMeasurementTypeTest < Minitest::Test

  def test_new
    measurement_type_params={
      "id": "672fbfc0-e0e6-11e3-8f08-12725f8f377c",
      "name": "ActualReportingNodes",
      "description": '',
      "perm_link": "LMI",
      "frequency": "monthly",
      "unit": "people",
      "related_entity_type_id": "896e2bae-e0d6-11e3-920e-12725f8f377c",
      "measurements": [
        {
          "id": "00d914dc-3fdd-11e4-ad72-12c37bb2d521",
          "period": "2014-07",
          "value": "3.0",
          "related_entity_id": "332a1aec-f1fb-11e3-bcb3-12725f8f377c"
        }
      ]
    }
    measurement_type = GlobalRegistryModels::MeasurementType::MeasurementType.new(measurement_type_params)
    assert_instance_of GlobalRegistryModels::MeasurementType::MeasurementType, measurement_type
    assert_equal "672fbfc0-e0e6-11e3-8f08-12725f8f377c", measurement_type.id
    assert_equal "ActualReportingNodes", measurement_type.name
    assert_equal "people", measurement_type.unit
  end

end
