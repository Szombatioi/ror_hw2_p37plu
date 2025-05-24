require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "should get create" do
  #   get comments_create_url
  #   assert_response :success
  # end

  setup do
    @user = users(:one)
    @record = records(:one)
  end

  test "bejelentkezve létre lehet hozni érvényes hozzászólást" do
    sign_in @user

    assert_difference("Comment.count", 1) do
      post land_record_comments_path(@record.land, @record), params: { comment: { text: "..." } }
    end

    assert_redirected_to land_record_path(@record.land, @record)
  end

  test "hibás hozzászólás nem kerül mentésre" do
    sign_in @user

    assert_no_difference("Comment.count") do
      post land_record_comments_path(@record.land, @record), params: { comment: { text: "" } }
    end

    assert_redirected_to land_record_path(@record.land, @record)
    assert_equal "Nem sikerült elküldeni a hozzászólást.", flash[:alert]
  end

  test "nem bejelentkezett felhasználót átirányít" do
    post land_record_comments_path(@record.land, @record), params: { comment: { text: "Kijelentkezett ember" } }

    assert_redirected_to new_user_session_path
  end
end
