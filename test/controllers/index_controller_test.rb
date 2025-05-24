require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  def setup
    @land = lands(:one)
    @record_with_lyrics = records(:one)  # feltételezzük, van lyrics és link is
    @record_without_lyrics = records(:two)  # üres lyrics, vagy nil
  end

  test "home oldal sikeresen betöltődik és tartalmazza a szükséges adatokat" do
    get root_path
    assert_response :success
    # assert_select "h1", /.*Tájegységek.*/i  # feltételezve, hogy van egy ilyen cím

    lands_data = assigns(:lands)
    assert_not_nil lands_data
    assert lands_data.is_a?(Array)

    land_data = lands_data.find { |entry| entry[:land] == @land }
    assert_not_nil land_data, "A tesztelt tájegység nem található a home oldalon"

    assert_equal @land.records.count, land_data[:record_count]
    assert_equal @land.records.where.not(lyrics: [nil, ""]).count, land_data[:lyrics_count]
    assert_equal @land.records.where.not(link: [nil, ""]).count, land_data[:links_count]
  end
end
