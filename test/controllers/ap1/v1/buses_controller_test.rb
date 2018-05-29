require 'test_helper'

class Ap1::V1::BusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ap1_v1_buses_index_url
    assert_response :success
  end

end
