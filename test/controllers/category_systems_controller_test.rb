require 'test_helper'

class CategorySystemsControllerTest < ActionController::TestCase
  setup do
    @category_system = category_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_system" do
    assert_difference('CategorySystem.count') do
      post :create, category_system: { category_id: @category_system.category_id, sistem_id: @category_system.sistem_id }
    end

    assert_redirected_to category_system_path(assigns(:category_system))
  end

  test "should show category_system" do
    get :show, id: @category_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_system
    assert_response :success
  end

  test "should update category_system" do
    patch :update, id: @category_system, category_system: { category_id: @category_system.category_id, sistem_id: @category_system.sistem_id }
    assert_redirected_to category_system_path(assigns(:category_system))
  end

  test "should destroy category_system" do
    assert_difference('CategorySystem.count', -1) do
      delete :destroy, id: @category_system
    end

    assert_redirected_to category_systems_path
  end
end
