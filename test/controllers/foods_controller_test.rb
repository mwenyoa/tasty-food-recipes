require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foods_index_url
    assert_response :success
  end

  test "should get create" do
    get foods_create_url
    assert_response :success
  end
end
