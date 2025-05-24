require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one)
  end

  test "érvényes a gyári fixture alapján" do
    assert @comment.valid?
  end

  test "szöveg jelenléte kötelező" do
    @comment.text = ""
    assert_not @comment.valid?, "A komment szöveg nem lehet üres"
  end

  test "hozzá van rendelve egy userhez" do
    @comment.user = nil
    assert_not @comment.valid?, "A kommentnek kell felhasználó"
  end

  test "hozzá van rendelve egy recordhoz" do
    @comment.record = nil
    assert_not @comment.valid?, "A kommentnek kell record"
  end
end
