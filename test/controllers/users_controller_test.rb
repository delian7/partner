require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
   test "should get index" do
    user = Factory(:user)
	visit login_path
	fill_in "id", :with => user.id
	click_button "Submit"
    assert_response :success
  end

end
