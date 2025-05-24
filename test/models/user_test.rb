require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "érvényes felhasználó a fixture alapján" do
    user = users(:one)
    assert user.valid?
  end

  test "felhasználónév kötelező" do
    user = users(:one)
    user.username = nil
    assert_not user.valid?
    assert_includes user.errors[:username], "can't be blank"
  end

  test "felhasználónév egyediség" do
    user1 = users(:one)
    user2 = user1.dup
    user2.email = "másik@example.com" # email is kötelező
    assert_not user2.valid?
    assert_includes user2.errors[:username], "has already been taken"
  end
end
