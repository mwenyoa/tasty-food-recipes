require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get recipes_index_url
    assert_response :success
  end

  test 'should get show' do
    get recipes_show_url
    assert_response :success
  end

  test 'should get create' do
    get recipes_create_url
    assert_response :success
  end
end
