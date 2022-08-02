require "test_helper"

class Admin::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get reported_posts" do
    get admin_reports_reported_posts_url
    assert_response :success
  end

  test "should get reported_comments" do
    get admin_reports_reported_comments_url
    assert_response :success
  end
end
