require "test_helper"

class RecordTest < ActiveSupport::TestCase
  test "érvényes a fixture alapján" do
    record = records(:one)
    assert record.valid?
  end

  test "land kötelező" do
    record = records(:one)
    record.land = nil
    assert_not record.valid?
    assert_includes record.errors[:land], "must exist"
  end

  test "commentek törlődnek rekord törlésekor" do
    record = records(:one)
    comment = comments(:one)
    assert_equal comment.record, record

    assert_difference("Comment.count", -1) do
      record.destroy
    end
  end

  test "title kötelező" do
    record = records(:one)
    record.title = nil
    assert_not record.valid?
  end
end
