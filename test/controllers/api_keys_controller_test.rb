require 'test_helper'

class ApiKeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_key = api_keys(:one)
  end

  test "should get index" do
    get api_keys_url
    assert_response :success
  end

  test "should create api_key" do
    assert_difference('ApiKey.count') do
      post api_keys_url, params: { api_key: { email: @api_key.email, key: @api_key.key } }
    end

    assert_response 201
  end

  test "should show api_key" do
    get api_key_url(@api_key)
    assert_response :success
  end

  test "should update api_key" do
    patch api_key_url(@api_key), params: { api_key: { email: @api_key.email, key: @api_key.key } }
    assert_response 200
  end

  test "should destroy api_key" do
    assert_difference('ApiKey.count', -1) do
      delete api_key_url(@api_key)
    end

    assert_response 204
  end
end
