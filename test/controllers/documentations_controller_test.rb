require 'test_helper'

class DocumentationsControllerTest < ActionController::TestCase
  setup do
    @documentation = documentations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:documentations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documentation" do
    assert_difference('Documentation.count') do
      post :create, documentation: { category: @documentation.category, configuration: @documentation.configuration, context: @documentation.context, description: @documentation.description, functionality: @documentation.functionality, groups: @documentation.groups, link: @documentation.link, part: @documentation.part, pratic: @documentation.pratic, requisito: @documentation.requisito, tag: @documentation.tag, traceable_item: @documentation.traceable_item }
    end

    assert_redirected_to documentation_path(assigns(:documentation))
  end

  test "should show documentation" do
    get :show, id: @documentation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @documentation
    assert_response :success
  end

  test "should update documentation" do
    patch :update, id: @documentation, documentation: { category: @documentation.category, configuration: @documentation.configuration, context: @documentation.context, description: @documentation.description, functionality: @documentation.functionality, groups: @documentation.groups, link: @documentation.link, part: @documentation.part, pratic: @documentation.pratic, requisito: @documentation.requisito, tag: @documentation.tag, traceable_item: @documentation.traceable_item }
    assert_redirected_to documentation_path(assigns(:documentation))
  end

  test "should destroy documentation" do
    assert_difference('Documentation.count', -1) do
      delete :destroy, id: @documentation
    end

    assert_redirected_to documentations_path
  end
end
