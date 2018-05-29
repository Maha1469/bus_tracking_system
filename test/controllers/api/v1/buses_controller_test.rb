require 'test_helper'

class Api::V1::BusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_buses_index_url
    assert_response :success
  end

end
