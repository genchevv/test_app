require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = User.create(username: "Radoslav", email: "radoslav@example.com", password: "password")
  end
  
  test "should get users index" do
    get :index
    assert_response :success
  end
  
  test "should get users new" do
    get :new
    assert_response :success
  end
  
  test "should get users show" do
    get(:show, { 'id' => @user.id })
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'User.count' do
      delete :destroy, user: user_path(@user)
    end
    
    assert_redirected_to categories_path
  end
end