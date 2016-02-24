require 'test_helper'

class MembershipsControllerTest < ActionController::TestCase
  setup do
    @membership = memberships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memberships)
  end

  test "should create membership" do
    assert_difference('Membership.count') do
      post :create, membership: { cafe_id: @membership.cafe_id, count: @membership.count }
    end

    assert_response 201
  end

  test "should show membership" do
    get :show, id: @membership
    assert_response :success
  end

  test "should update membership" do
    put :update, id: @membership, membership: { cafe_id: @membership.cafe_id, count: @membership.count }
    assert_response 204
  end

  test "should destroy membership" do
    assert_difference('Membership.count', -1) do
      delete :destroy, id: @membership
    end

    assert_response 204
  end
end
