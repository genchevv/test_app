require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  
  test "should sign up a user" do
    get signup_path
    assert_template 'users/new'
    
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username: "Radoslav Tester", 
                                            email: "radoslavtester@gmail.com",
                                            password: "password" }
    end
    
    assert_template 'users/show'
    assert_match 'Radoslav Tester', response.body
  end
  
end