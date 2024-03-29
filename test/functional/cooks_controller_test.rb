require 'test_helper'

class CooksControllerTest < ActionController::TestCase
  
  def cook_data
    Struct.new(:name, :email, :password).new('Mal', 'captn@serenity.space', 'f1r3fly')
  end
  
  def complete_cook_hash
    cook = cook_data
    Hash[cook.members.zip(cook.values)]
  end
  

  setup do
    sign_in_as_user
    @cook = cooks(:normal_cook)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cook" do
    assert_difference('Cook.count') do
      post :create, cook: complete_cook_hash
    end

    assert_redirected_to cook_path(assigns(:cook))
  end

  test "should show cook" do
    get :show, id: @cook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cook
    assert_response :success
  end

  test "should update cook" do
    put :update, id: @cook, cook: complete_cook_hash.slice(:name, :email)
    assert_redirected_to cook_path(assigns(:cook))
  end

  test "should destroy cook" do
    assert_difference('Cook.count', -1) do
      delete :destroy, id: @cook
    end

    assert_redirected_to cooks_path
  end
end
