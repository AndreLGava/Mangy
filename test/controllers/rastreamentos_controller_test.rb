require 'test_helper'

class RastreamentosControllerTest < ActionController::TestCase
  setup do
    @rastreamento = rastreamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rastreamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rastreamento" do
    assert_difference('Rastreamento.count') do
      post :create, rastreamento: { issue_id: @rastreamento.issue_id, pessoa_id: @rastreamento.pessoa_id, status_id: @rastreamento.status_id, time: @rastreamento.time }
    end

    assert_redirected_to rastreamento_path(assigns(:rastreamento))
  end

  test "should show rastreamento" do
    get :show, id: @rastreamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rastreamento
    assert_response :success
  end

  test "should update rastreamento" do
    patch :update, id: @rastreamento, rastreamento: { issue_id: @rastreamento.issue_id, pessoa_id: @rastreamento.pessoa_id, status_id: @rastreamento.status_id, time: @rastreamento.time }
    assert_redirected_to rastreamento_path(assigns(:rastreamento))
  end

  test "should destroy rastreamento" do
    assert_difference('Rastreamento.count', -1) do
      delete :destroy, id: @rastreamento
    end

    assert_redirected_to rastreamentos_path
  end
end
