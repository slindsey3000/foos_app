require "test_helper"

class ClubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club = clubs(:one)
  end

  test "should get index" do
    get clubs_url
    assert_response :success
  end

  test "should get new" do
    get new_club_url
    assert_response :success
  end

  test "should create club" do
    assert_difference("Club.count") do
      post clubs_url, params: { club: { address: @club.address, city: @club.city, contact_person: @club.contact_person, coordinates: @club.coordinates, day_and_time_info: @club.day_and_time_info, description: @club.description, email: @club.email, established_date: @club.established_date, image_url: @club.image_url, name: @club.name, phone: @club.phone, state: @club.state, website: @club.website, zip_code: @club.zip_code } }
    end

    assert_redirected_to club_url(Club.last)
  end

  test "should show club" do
    get club_url(@club)
    assert_response :success
  end

  test "should get edit" do
    get edit_club_url(@club)
    assert_response :success
  end

  test "should update club" do
    patch club_url(@club), params: { club: { address: @club.address, city: @club.city, contact_person: @club.contact_person, coordinates: @club.coordinates, day_and_time_info: @club.day_and_time_info, description: @club.description, email: @club.email, established_date: @club.established_date, image_url: @club.image_url, name: @club.name, phone: @club.phone, state: @club.state, website: @club.website, zip_code: @club.zip_code } }
    assert_redirected_to club_url(@club)
  end

  test "should destroy club" do
    assert_difference("Club.count", -1) do
      delete club_url(@club)
    end

    assert_redirected_to clubs_url
  end
end
