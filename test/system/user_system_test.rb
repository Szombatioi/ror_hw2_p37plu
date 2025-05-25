require "application_system_test_case"

class UserFlowsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test "felhasználó belép és készít egy tájegységet, egy zenét és egy kommentet" do
    visit new_user_session_path
    fill_in "Email-cím", with: @user.email
    fill_in "Jelszó", with: 'password123'
    click_button "Bejelentkezés"

    assert_text "Népzenei gyűjtemény"

    # Tájegység létrehozása
    visit new_land_path
    fill_in "Tájegység neve", with: "System Test Land"
    click_button "Hozzáad"

    assert_text "Tájegység felvéve."
    assert_text "System Test Land"

    # Zene létrehozása a Tájegységhez
    click_link "System Test Land"
    click_button "Felvétel"
    fill_in "Cím", with: "System Test Record"
    fill_in "Szöveg", with: "Details from system test"
    fill_in "Link", with: "https://example.com/test-record"
    click_button "Hozzáad"

    assert_text "Dal felvéve."
    assert_text "System Test Record"

    # Comment hozzáadása a Zenéhez
    click_link "System Test Record"
    fill_in "Írj egy hozzászólást...", with: "This is a system test comment"
    click_button "Küldés"

    assert_text "This is a system test comment"
  end
end