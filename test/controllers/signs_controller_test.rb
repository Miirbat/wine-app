require 'test_helper'

class SignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sign = signs(:one)
  end

  test "should get index" do
    get signs_url, as: :json
    assert_response :success
  end

  test "should create sign" do
    assert_difference('Sign.count') do
      post signs_url, params: { sign: { description: @sign.description, name: @sign.name } }, as: :json
    end

    assert_response 201
  end

  test "should show sign" do
    get sign_url(@sign), as: :json
    assert_response :success
  end

  test "should update sign" do
    patch sign_url(@sign), params: { sign: { description: @sign.description, name: @sign.name } }, as: :json
    assert_response 200
  end

  test "should destroy sign" do
    assert_difference('Sign.count', -1) do
      delete sign_url(@sign), as: :json
    end

    assert_response 204
  end
end
