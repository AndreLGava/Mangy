require 'test_helper'

class TecnologiesControllerTest < ActionController::TestCase
  setup do
    @tecnology = tecnologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tecnologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tecnology" do
    assert_difference('Tecnology.count') do
      post :create, tecnology: { description: @tecnology.description }
    end

    assert_redirected_to tecnology_path(assigns(:tecnology))
  end

  test "should show tecnology" do
    get :show, id: @tecnology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tecnology
    assert_response :success
  end

  test "should update tecnology" do
    patch :update, id: @tecnology, tecnology: { description: @tecnology.description }
    assert_redirected_to tecnology_path(assigns(:tecnology))
  end

  test "should destroy tecnology" do
    assert_difference('Tecnology.count', -1) do
      delete :destroy, id: @tecnology
    end

    assert_redirected_to tecnologies_path
  end
end
