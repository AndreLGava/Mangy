require 'test_helper'

class SistemsControllerTest < ActionController::TestCase
  setup do
    @sistem = sistems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sistems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sistem" do
    assert_difference('Sistem.count') do
      post :create, sistem: { description: @sistem.description }
    end

    assert_redirected_to sistem_path(assigns(:sistem))
  end

  test "should show sistem" do
    get :show, id: @sistem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sistem
    assert_response :success
  end

  test "should update sistem" do
    patch :update, id: @sistem, sistem: { description: @sistem.description }
    assert_redirected_to sistem_path(assigns(:sistem))
  end

  test "should destroy sistem" do
    assert_difference('Sistem.count', -1) do
      delete :destroy, id: @sistem
    end

    assert_redirected_to sistems_path
  end
end
