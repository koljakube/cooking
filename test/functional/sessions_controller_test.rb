require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  def default_password
    "test"
  end
  
  test "should get new if not logged in" do
    get :new
    assert_response :success
  end
  
  test "should redirect to root if getting new and not signed in" do
    sign_in_as_user
    get :new
    assert_redirected_to root_url
  end
  
  test "can sign in" do
    cook = cooks(:normal_cook)
    post :create, { name: cook.name, password: default_password }
    refute_nil session[:cook_id] # TODO: Can I get access to application controller helpers?
    assert_equal Cook.find_by_name(cook.name).id, session[:cook_id]
  end
  
  test "can sign out" do
    sign_in_as_user
    delete :destroy
    assert_nil session[:cook_id]
  end
    
end
