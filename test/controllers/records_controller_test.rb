require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @land = lands(:one)
    @record = records(:one)
    sign_in @user
  end

  test "GET #show betölti az oldalt helyesen" do
    get land_record_path(@land, @record)
    assert_response :success
    assert_select "h1", text: @record.title
  end

  test "GET #show nem létező record esetén 404" do
    get land_record_path(@land, id: -1)
    assert_response :not_found
    assert_match "Nem található a felvétel", response.body
  end

  test "GET #new új űrlap megjelenik" do
    get new_land_record_path(@land)
    assert_response :success
    assert_select "form"
  end

  test "POST #create létrehozza a rekordot érvényes adatokkal" do
    assert_difference("Record.count", 1) do
      post land_records_path(@land), params: {
        record: {
          title: "Teszt Felvétel",
          lyrics: "Ez egy szöveg",
          link: "https://példa.hu"
        }
      }
    end
    assert_redirected_to land_path(@land)
  end

  test "POST #create hibás adatokkal nem ment" do
    assert_no_difference("Record.count") do
      post land_records_path(@land), params: {
        record: {
          title: "",
          lyrics: "",
          link: ""
        }
      }
    end
    assert_response :unprocessable_entity
    assert_select "form"
  end

  test "GET #edit betölti a szerkesztő űrlapot" do
    get edit_land_record_path(@land, @record)
    assert_response :success
    assert_select "form"
  end

  test "PATCH #update frissít érvényes adatokkal" do
    patch land_record_path(@land, @record), params: {
      record: {
        title: "Módosított cím"
      }
    }
    assert_redirected_to land_record_path(@land, @record)
    @record.reload
    assert_equal "Módosított cím", @record.title
  end

  test "PATCH #update hibás adatokkal nem frissít" do
    patch land_record_path(@land, @record), params: {
      record: {
        title: ""
      }
    }
    assert_response :unprocessable_entity
    assert_select "form"
  end
end
