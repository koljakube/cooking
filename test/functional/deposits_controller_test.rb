require 'test_helper'

class DepositsControllerTest < ActionController::TestCase
  
  def deposit_data
    Struct.new(:cook_id, :amount, :date).new(Cook.first.id, 1000, Date.today)
  end
  
  def complete_deposit_hash
    deposit = deposit_data
    Hash[deposit.members.zip(deposit.values)]
  end
  
  
  setup do
    sign_in_as_user
    @deposit = deposits(:deposit1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deposits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deposit" do
    assert_difference('Deposit.count') do
      post :create, deposit: complete_deposit_hash
    end

    assert_redirected_to deposit_path(assigns(:deposit))
  end

  test "should show deposit" do
    get :show, id: @deposit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deposit
    assert_response :success
  end

  test "should update deposit" do
    put :update, id: @deposit, deposit: complete_deposit_hash
    assert_redirected_to deposit_path(assigns(:deposit))
  end

  test "should destroy deposit" do
    assert_difference('Deposit.count', -1) do
      delete :destroy, id: @deposit
    end

    assert_redirected_to deposits_path
  end
end
