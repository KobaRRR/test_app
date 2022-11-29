require "test_helper"

class BcardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bcard_index_url
    assert_response :success
  end
end
