require 'test_helper'

class DishesControllerTest < ActionController::TestCase
  
  def dish_data
    Struct.new(:name, :price, :date).new('Eclectic Eel', 2545, 3.days.ago)
  end
  
  def complete_dish_hash
    dish = dish_data
    Hash[dish.members.zip(dish.values)]
  end
  

  setup do
    sign_in_as_user
    @dish = dishes(:dish1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dish" do
    assert_difference('Dish.count') do
      post :create, dish: complete_dish_hash
    end

    assert_redirected_to dish_path(assigns(:dish))
  end

  test "should show dish" do
    get :show, id: @dish
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dish
    assert_response :success
  end

  test "should update dish" do
    put :update, id: @dish, dish: complete_dish_hash
    assert_redirected_to dish_path(assigns(:dish))
  end

  test "should destroy dish" do
    assert_difference('Dish.count', -1) do
      delete :destroy, id: @dish
    end

    assert_redirected_to dishes_path
  end
end
