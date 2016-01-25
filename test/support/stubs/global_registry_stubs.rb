module GlobalRegistryStubs
  def before_setup
    super

    # Search test entity
    stub_request(:get, /https:\/\/test-api.global-registry.org\/entities\?entity_type=test&.*/).
      with(headers: {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, headers: {}, body: %({
        "entities": [
          {
            "test": {
              "id": "219A7C20-58B8-11E5-B850-6BAC9D6E46F5",
              "name": "Institute of Technology",
              "phone": "+1-234-567-8901",
              "is_active": true,
              "ministry:relationship": {
                "ministry": "33FB2B8A-58B8-11E5-98F1-6BAC9D6E46F5",
                "relationship_entity_id": "384295F2-58B8-11E5-98F1-6BAC9D6E46F5",
                "client_integration_id": "3C63F00E-58B8-11E5-8402-6BAC9D6E46F5"
              },
              "client_integration_id": "400BF486-58B8-11E5-9BB3-6BAC9D6E46F5"
            }
          },
          {
            "test": {
              "id": "641E71B8-58B9-11E5-910C-65A7C0F9A297",
              "name": "Helsingin kauppakorkeakoulu",
              "phone": "1234567890",
              "is_active": true,
              "client_integration_id": "688B7606-58B9-11E5-88C6-65A7C0F9A297"
            }
          }
        ],
        "meta": {
          "page": 1,
          "next_page": false,
          "from": 1,
          "to": 2
        }
      }))



    # Get a single test entity
    stub_request(:get, "https://test-api.global-registry.org/entities/219A7C20-58B8-11E5-B850-6BAC9D6E46F5").
      with(headers: {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, headers: {}, body: %({
        "entity": {
          "test": {
            "id": "219A7C20-58B8-11E5-B850-6BAC9D6E46F5",
            "name": "Institute of Technology",
            "phone": "+1-234-567-8901",
            "is_active": true,
            "ministry:relationship": {
              "ministry": "33FB2B8A-58B8-11E5-98F1-6BAC9D6E46F5",
              "relationship_entity_id": "384295F2-58B8-11E5-98F1-6BAC9D6E46F5",
              "client_integration_id": "3C63F00E-58B8-11E5-8402-6BAC9D6E46F5"
            },
            "client_integration_id": "400BF486-58B8-11E5-9BB3-6BAC9D6E46F5"
          }
        }
      }))

    # Blank search for "test" entity
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}},{"test":{"id":"0000-0000-0000-0002","phone":"1800TEST","name":"Count Testalot","client_integration_id":"2222","is_active":true}}],"meta":{"page":1,"next_page":true,"from":1,"to":2}}), :headers => {})

    # Search with filters for "test" entity
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&filters%5Battribute%5D%5Bnested%5D=test&filters%5Bname%5D=Mr&filters%5Bphone%5D=1-800-TEST").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}},{"test":{"id":"0000-0000-0000-0002","phone":"1800TEST","name":"Count Testalot","client_integration_id":"2222","is_active":true}}],"meta":{"page":1,"next_page":true,"from":1,"to":2}}), :headers => {})

    # Search with relationship filters
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&filters%5Bministry:relationship:role%5D=Director&filters%5Bwife:relationship%5D%5Bfirst_name%5D=wilma").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[],"meta":{"page":1,"next_page":false,"from":1,"to":1}}), :headers => {})

    # Search with order for "test" entity
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&order=name%20asc,phone%20desc").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}},{"test":{"id":"0000-0000-0000-0002","phone":"1800TEST","name":"Count Testalot","client_integration_id":"2222","is_active":true}}],"meta":{"page":1,"next_page":true,"from":1,"to":2}}), :headers => {})

    # Search with pagination
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&page=45&per_page=76").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}},{"test":{"id":"0000-0000-0000-0002","phone":"1800TEST","name":"Count Testalot","client_integration_id":"2222","is_active":true}}],"meta":{"page":45,"next_page":true,"from":1,"to":2}}), :headers => {})

    # Get a "test" entity
    stub_request(:get, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entity":{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}}}), :headers => {})

    # Get page 1 of "test" entities, the first page
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&page=1").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}},{"test":{"id":"0000-0000-0000-0002","phone":"1800TEST","name":"Count Testalot","client_integration_id":"2222","is_active":true}}],"meta":{"page":1,"next_page":true,"from":1,"to":2}}), :headers => {})

    # Get page 2 of "test" entities, the last page
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&page=2").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[{"test":{"id":"0000-0000-0000-0001","phone":"+1234567890","name":"Mr. Test","client_integration_id":"1234","is_active":true}},{"test":{"id":"0000-0000-0000-0002","phone":"1800TEST","name":"Count Testalot","client_integration_id":"2222","is_active":true}}],"meta":{"page":2,"next_page":false,"from":3,"to":4}}), :headers => {})

    # Get page 3 of "test" entities, this page doesn't exist because page 2 was the last page
    stub_request(:get, "https://test-api.global-registry.org/entities?entity_type=test&page=3").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entities":[],"meta":{"page":3,"next_page":false,"from":4,"to":5}}), :headers => {})

    # Delete a "test" entity
    stub_request(:delete, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => %({"entity":{"test":{"id":"0000-0000-0000-0001"}}}), :headers => {})

    # Create a "test" entity
    stub_request(:post, "https://test-api.global-registry.org/entities").
      with(:body => "{\"entity\":{\"test\":{\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\"}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'86', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:post, "https://test-api.global-registry.org/entities").
      with(:body => "{\"entity\":{\"test\":{\"client_integration_id\":\"1\",\"phone\":\"1800TEST\",\"name\":\"Mr. Test\",\"is_active\":null}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'103', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:post, "https://test-api.global-registry.org/entities").
      with(:body => "{\"entity\":{\"test\":{\"client_integration_id\":\"1\",\"is_active\":false}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'67', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"client_integration_id\":\"1\",\"is_active\":false}}}", :headers => {})

    # Update a "test" entity
    stub_request(:put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:body => "{\"entity\":{\"test\":{\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\"}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'86', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:body => "{\"entity\":{\"test\":{\"client_integration_id\":\"1\",\"phone\":\"1800TEST\",\"name\":\"Mr. Test\",\"is_active\":null}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'103', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:body => "{\"entity\":{\"test\":{\"client_integration_id\":\"1\",\"phone\":\"1800TEST\",\"name\":\"Mr. Test\",\"is_active\":true}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'103', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:body => "{\"entity\":{\"test\":{\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":false}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'104', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:body => "{\"entity\":{\"test\":{\"client_integration_id\":\"1\",\"is_active\":false}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'67', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":true}}}", :headers => {})
    stub_request(:put, "https://test-api.global-registry.org/entities/0000-0000-0000-0001").
      with(:body => "{\"entity\":{\"test\":{\"client_integration_id\":\"1\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\"}}}",
           :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'Content-Length'=>'86', 'Content-Type'=>'application/json', 'Timeout'=>'-1', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "{\"entity\":{\"test\":{\"id\":\"0000-0000-0000-0001\",\"name\":\"Mr. Test\",\"phone\":\"1800TEST\",\"client_integration_id\":\"1\",\"is_active\":null}}}", :headers => {})


    # Get test entity types
    stub_request(:get, /https:\/\/test-api.global-registry.org\/entity_types\?field_type=entity*/).
      with(headers: {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Bearer test', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, headers: {}, body: %({
        "entity_types":[{
          "id":"e9b8aaf0-1994-11e5-a76d-12c37bb2d521",
          "name":"position_role",
          "description":"Root level position_role entity type to store enum values",
          "data_visibility":"public",
          "enum_values":["Team Member","Team Leader","Not Applicable"],
          "field_type":"enum_values",
          "is_editable":false,
          "unique_value":false
          },
          {"id":"0ffb3164-2044-11e5-a05f-12c37bb2d521",
          "name":"target_area_ministry_presence",
          "description":"Root level target_area_ministry_presence entity type to store enum values",
          "data_visibility":"public",
          "enum_values":["Unknown","No Presence","Ministry","Movement","Partner"]
          ,"field_type":"enum_values",
          "is_editable":false,
          "unique_value":false
          },{
          "id":"a5499c9a-d556-11e3-af5a-12725f8f377c",
          "name":"ministry",
          "description":"Entity object to hold information about a ministry",
          "data_visibility":"public",
          "fields":[
              {"id":"97d1e40e-d557-11e3-8ea8-12725f8f377c",
              "name":"is_active",
              "data_visibility":"public",
              "field_type":"boolean",
              "is_editable":false,
              "unique_value":false,
              "fields":[
                  {"id":"97d1e40e-d557-11e3-8ea8-12725f8f377c",
                  "name":"is_active",
                  "data_visibility":"public",
                  "field_type":"boolean",
                  "is_editable":false,
                  "unique_value":false
                  },{
                  "id":"addb95ba-d557-11e3-8422-12725f8f377c",
                  "name":"sp_phone",
                  "data_visibility":"public",
                  "field_type":"string",
                  "is_editable":false,
                  "unique_value":false
                  }]
              },{
              "id":"adbf4b30-d557-11e3-bbc8-12725f8f377c",
              "name":"note",
              "data_visibility":"public",
              "field_type":"string",
              "is_editable":false,
              "unique_value":false
              },{
              "id":"addb95ba-d557-11e3-8422-12725f8f377c",
              "name":"sp_phone",
              "data_visibility":"public",
              "field_type":"string",
              "is_editable":false,
              "unique_value":false
              }]
          }
        ],
        "meta": {
          "page": 1,
          "next_page": false,
          "from": 1,
          "to": 2
        }
      }))
  end
end

class MiniTest::Test
  include GlobalRegistryStubs
end
