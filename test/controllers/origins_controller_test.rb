require "test_helper"

class OriginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @origin = origins(:one)
  end

  test "should get index" do
    get origins_url
    assert_response :success
  end

  test "should get new" do
    get new_origin_url
    assert_response :success
  end

  test "should create origin" do
    assert_difference("Origin.count") do
      post origins_url, params: { origin: { origin: @origin.origin } }
    end

    assert_redirected_to origin_url(Origin.last)
  end

  test "should show origin" do
    get origin_url(@origin)
    assert_response :success
  end

  test "should get edit" do
    get edit_origin_url(@origin)
    assert_response :success
  end

  test "should update origin" do
    patch origin_url(@origin), params: { origin: { origin: @origin.origin } }
    assert_redirected_to origin_url(@origin)
  end

  test "should destroy origin" do
    assert_difference("Origin.count", -1) do
      delete origin_url(@origin)
    end

    assert_redirected_to origins_url
  end
end
