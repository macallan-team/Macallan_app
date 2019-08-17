require 'test_helper'

class CostsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get costs_edit_url
    assert_response :success
  end

end
