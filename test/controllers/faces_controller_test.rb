require 'test_helper'

class FacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faces_index_url
    assert_response :success
  end

end
