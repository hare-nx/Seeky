require "test_helper"

class Admin::FrameQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_frame_questions_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_frame_questions_index_url
    assert_response :success
  end
end
