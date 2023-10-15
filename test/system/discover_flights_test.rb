require "application_system_test_case"

class DiscoverFlightsTest < ApplicationSystemTestCase
  setup do
    @discover_flight = discover_flights(:one)
  end

  test "visiting the index" do
    visit discover_flights_url
    assert_selector "h1", text: "Discover flights"
  end

  test "should create discover flight" do
    visit discover_flights_url
    click_on "New discover flight"

    fill_in "Aircraft", with: @discover_flight.aircraft
    fill_in "Alternate date", with: @discover_flight.alternate_date
    fill_in "Comments", with: @discover_flight.comments
    fill_in "Email", with: @discover_flight.email
    fill_in "First name", with: @discover_flight.first_name
    fill_in "Last name", with: @discover_flight.last_name
    fill_in "Phone", with: @discover_flight.phone
    fill_in "Preferred availability", with: @discover_flight.preferred_availability
    fill_in "Preferred date", with: @discover_flight.preferred_date
    click_on "Create Discover flight"

    assert_text "Discover flight was successfully created"
    click_on "Back"
  end

  test "should update Discover flight" do
    visit discover_flight_url(@discover_flight)
    click_on "Edit this discover flight", match: :first

    fill_in "Aircraft", with: @discover_flight.aircraft
    fill_in "Alternate date", with: @discover_flight.alternate_date
    fill_in "Comments", with: @discover_flight.comments
    fill_in "Email", with: @discover_flight.email
    fill_in "First name", with: @discover_flight.first_name
    fill_in "Last name", with: @discover_flight.last_name
    fill_in "Phone", with: @discover_flight.phone
    fill_in "Preferred availability", with: @discover_flight.preferred_availability
    fill_in "Preferred date", with: @discover_flight.preferred_date
    click_on "Update Discover flight"

    assert_text "Discover flight was successfully updated"
    click_on "Back"
  end

  test "should destroy Discover flight" do
    visit discover_flight_url(@discover_flight)
    click_on "Destroy this discover flight", match: :first

    assert_text "Discover flight was successfully destroyed"
  end
end
