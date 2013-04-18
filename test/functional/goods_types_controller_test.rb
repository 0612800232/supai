require 'test_helper'

class GoodsTypesControllerTest < ActionController::TestCase
  setup do
    @goods_type = goods_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_type" do
    assert_difference('GoodsType.count') do
      post :create, :goods_type => @goods_type.attributes
    end

    assert_redirected_to goods_type_path(assigns(:goods_type))
  end

  test "should show goods_type" do
    get :show, :id => @goods_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @goods_type.to_param
    assert_response :success
  end

  test "should update goods_type" do
    put :update, :id => @goods_type.to_param, :goods_type => @goods_type.attributes
    assert_redirected_to goods_type_path(assigns(:goods_type))
  end

  test "should destroy goods_type" do
    assert_difference('GoodsType.count', -1) do
      delete :destroy, :id => @goods_type.to_param
    end

    assert_redirected_to goods_types_path
  end
end
