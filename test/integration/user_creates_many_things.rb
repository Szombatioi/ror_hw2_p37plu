# test/integration/user_creates_land_record_comment_test.rb
require 'test_helper'

class UserCreatesLandRecordCommentTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    sign_in @user
  end

  test "Felhasználó készít egy tájegységet, zenét és kommentet" do
    # User létrehoz egy Tájegységet
    post lands_path, params: { land: { name: "Test Land", location: "Budapest" } }
    assert_response :redirect
    land = Land.last
    assert_equal "Test Land", land.name

    # User létrehoz egy Zenét a tájegységhez
    post land_records_path(land), params: { record: { title: "First Record", content: "Important details" } }
    assert_response :redirect
    record = Record.last
    assert_equal "First Record", record.title
    assert_equal land.id, record.land_id

    # User létrehoz egy kommentet
    post land_record_comments_path(land, record), params: { comment: { text: "Nice record!" } }
    assert_response :redirect
    comment = Comment.last
    assert_equal "Nice record!", comment.text
    assert_equal record.id, comment.record_id
  end
end