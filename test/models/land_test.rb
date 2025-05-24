require "test_helper"

class LandTest < ActiveSupport::TestCase
  test "érvényes land a fixture alapján" do
    land = lands(:one)
    assert land.valid?
  end

  test "név kötelező" do
    land = lands(:one)
    land.name = nil
    assert_not land.valid?
    assert_includes land.errors[:name], "can't be blank"
  end

  test "név egyediség" do
    duplicate = lands(:one).dup
    assert_not duplicate.valid?, "A névnek egyedinek kell lennie"
    assert_includes duplicate.errors[:name], "Már létezik ilyen nevű tájegység."
  end
end
