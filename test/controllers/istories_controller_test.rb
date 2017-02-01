require 'test_helper'

class IstoriesControllerTest < ActionController::TestCase
  setup do
    @istory = istories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:istories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create istory" do
    assert_difference('Istory.count') do
      post :create, istory: { category_id: @istory.category_id, description: @istory.description, sprint_id: @istory.sprint_id, url: @istory.url }
    end

    assert_redirected_to istory_path(assigns(:istory))
  end

  test "should show istory" do
    get :show, id: @istory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @istory
    assert_response :success
  end

  test "should update istory" do
    patch :update, id: @istory, istory: { category_id: @istory.category_id, description: @istory.description, sprint_id: @istory.sprint_id, url: @istory.url }
    assert_redirected_to istory_path(assigns(:istory))
  end

  test "should destroy istory" do
    assert_difference('Istory.count', -1) do
      delete :destroy, id: @istory
    end

    assert_redirected_to istories_path
  end
end
