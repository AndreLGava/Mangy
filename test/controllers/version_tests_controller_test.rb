require 'test_helper'

class VersionTestsControllerTest < ActionController::TestCase
  setup do
    @version_test = version_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:version_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create version_test" do
    assert_difference('VersionTest.count') do
      post :create, version_test: { check: @version_test.check, impact: @version_test.impact, obtained_result: @version_test.obtained_result, text_id: @version_test.text_id, version_id: @version_test.version_id }
    end

    assert_redirected_to version_test_path(assigns(:version_test))
  end

  test "should show version_test" do
    get :show, id: @version_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @version_test
    assert_response :success
  end

  test "should update version_test" do
    patch :update, id: @version_test, version_test: { check: @version_test.check, impact: @version_test.impact, obtained_result: @version_test.obtained_result, text_id: @version_test.text_id, version_id: @version_test.version_id }
    assert_redirected_to version_test_path(assigns(:version_test))
  end

  test "should destroy version_test" do
    assert_difference('VersionTest.count', -1) do
      delete :destroy, id: @version_test
    end

    assert_redirected_to version_tests_path
  end
end
