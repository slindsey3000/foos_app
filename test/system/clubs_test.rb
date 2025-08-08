require "application_system_test_case"

class ClubsTest < ApplicationSystemTestCase
  setup do
    @club = clubs(:one)
  end

  test "visiting the index" do
    visit clubs_url
    assert_selector "h1", text: "Clubs"
  end

  test "should create club" do
    visit clubs_url
    click_on "New club"

    fill_in "Address", with: @club.address
    fill_in "City", with: @club.city
    fill_in "Contact person", with: @club.contact_person
    fill_in "Coordinates", with: @club.coordinates
    fill_in "Day and time info", with: @club.day_and_time_info
    fill_in "Description", with: @club.description
    fill_in "Email", with: @club.email
    fill_in "Established date", with: @club.established_date
    fill_in "Image url", with: @club.image_url
    fill_in "Name", with: @club.name
    fill_in "Phone", with: @club.phone
    fill_in "State", with: @club.state
    fill_in "Website", with: @club.website
    fill_in "Zip code", with: @club.zip_code
    click_on "Create Club"

    assert_text "Club was successfully created"
    click_on "Back"
  end

  test "should update Club" do
    visit club_url(@club)
    click_on "Edit this club", match: :first

    fill_in "Address", with: @club.address
    fill_in "City", with: @club.city
    fill_in "Contact person", with: @club.contact_person
    fill_in "Coordinates", with: @club.coordinates
    fill_in "Day and time info", with: @club.day_and_time_info
    fill_in "Description", with: @club.description
    fill_in "Email", with: @club.email
    fill_in "Established date", with: @club.established_date
    fill_in "Image url", with: @club.image_url
    fill_in "Name", with: @club.name
    fill_in "Phone", with: @club.phone
    fill_in "State", with: @club.state
    fill_in "Website", with: @club.website
    fill_in "Zip code", with: @club.zip_code
    click_on "Update Club"

    assert_text "Club was successfully updated"
    click_on "Back"
  end

  test "should destroy Club" do
    visit club_url(@club)
    click_on "Destroy this club", match: :first

    assert_text "Club was successfully destroyed"
  end
end
