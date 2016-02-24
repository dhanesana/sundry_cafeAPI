require 'test_helper'

class CavesControllerTest < ActionController::TestCase
  setup do
    @cafe = caves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caves)
  end

  test "should create cafe" do
    assert_difference('Cafe.count') do
      post :create, cafe: { cafe_type: @cafe.cafe_type, eng_name: @cafe.eng_name, kor_name: @cafe.kor_name, url: @cafe.url }
    end

    assert_response 201
  end

  test "should show cafe" do
    get :show, id: @cafe
    assert_response :success
  end

  test "should update cafe" do
    put :update, id: @cafe, cafe: { cafe_type: @cafe.cafe_type, eng_name: @cafe.eng_name, kor_name: @cafe.kor_name, url: @cafe.url }
    assert_response 204
  end

  test "should destroy cafe" do
    assert_difference('Cafe.count', -1) do
      delete :destroy, id: @cafe
    end

    assert_response 204
  end
end
