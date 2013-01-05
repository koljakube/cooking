require 'test_helper'

class SignInRequiredTest < ActionDispatch::IntegrationTest
  
  test "cannot access cooks without signing in" do
    get '/cooks'
    assert_response :redirect
  end
  
end
