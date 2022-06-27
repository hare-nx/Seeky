require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get favorites" do
    get public_users_favorites_url
    assert_response :success
  end

  test "should get following" do
    get public_users_following_url
    assert_response :success
  end

  test "should get followers" do
    get public_users_followers_url
    assert_response :success
  end

  test "should get comments" do
    get public_users_comments_url
    assert_response :success
  end

  test "should get welcome" do
    get public_users_welcome_url
    assert_response :success
  end

  test "should get analysis" do
    get public_users_analysis_url
    assert_response :success
  end

  test "should get result" do
    get public_users_result_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_users_unsubscribe_url
    assert_response :success
  end
end
