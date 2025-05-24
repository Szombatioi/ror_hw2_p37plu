require "test_helper"

class LandsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @land = lands(:one)
  end

  test "show oldal megjelenik érvényes ID-re" do
    get land_path(@land)
    assert_response :success
    assert_select "h1", text: "Felvételek: "+@land.name
  end

  test "show oldal 404-et ad nem létező ID-re" do
    get land_path(id: -1)
    assert_response :not_found
    assert_match "Nem található a tájegység", response.body
  end

  test "new oldal betöltése" do
    get new_land_path
    assert_response :success
    assert_select "form"
  end

  test "sikeres tájegység létrehozása képfájl nélkül" do
    assert_difference('Land.count', 1) do
      post lands_path, params: {
        land: {
          name: "Új Tájegység"
        }
      }
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_match "Tájegység felvéve", response.body
  end

  test "hibás tájegység létrehozása meglévő névvel" do
    post lands_path, params: {
      land: { name: @land.name }
    }
    assert_response :unprocessable_entity
    assert_select "div.alert", text: /Már létezik/
  end
end
