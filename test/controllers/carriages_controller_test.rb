require 'test_helper'

class CarriagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get carriages_new_url
    assert_response :success
  end

  test "should get edit" do
    get carriages_edit_url
    assert_response :success
  end

  test "should get index" do
    get carriages_index_url
    assert_response :success
  end

end
