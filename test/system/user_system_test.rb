require "application_system_test_case"

class UserFlowsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test "user logs in and creates land, record and comment" do
    visit new_user_session_path
    fill_in "Email-cím", with: @user.email
    fill_in "Jelszó", with: 'password123'
    click_button "Bejelentkezés"

    assert_text "Népzenei gyűjtemény"

    # Land létrehozása
    visit new_land_path
    fill_in "Tájegység neve", with: "System Test Land"
    click_button "Hozzáad"

    assert_text "Tájegység felvéve."
    assert_text "System Test Land"

    # Record létrehozása a Landhez
    click_link "System Test Land"
    click_button "Felvétel"
    fill_in "Cím", with: "System Test Record"
    fill_in "Szöveg", with: "Details from system test"
    fill_in "Link", with: "https://example.com/test-record"
    click_button "Hozzáad"

    assert_text "Dal felvéve."
    assert_text "System Test Record"

    # Comment hozzáadása a Recordhoz
    click_link "System Test Record"
    fill_in "Írj egy hozzászólást...", with: "This is a system test comment"
    click_button "Küldés"

    assert_text "This is a system test comment"
  end
end