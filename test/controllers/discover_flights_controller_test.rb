require "test_helper"

class DiscoverFlightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discover_flight = discover_flights(:one)
  end

  test "should get index" do
    get discover_flights_url
    assert_response :success
  end

  test "should get new" do
    get new_discover_flight_url
    assert_response :success
  end

  test "should create discover_flight" do
    assert_difference("DiscoverFlight.count") do
      post discover_flights_url, params: { discover_flight: { aircraft: @discover_flight.aircraft, alternate_date: @discover_flight.alternate_date, comments: @discover_flight.comments, email: @discover_flight.email, first_name: @discover_flight.first_name, last_name: @discover_flight.last_name, phone: @discover_flight.phone, preferred_availability: @discover_flight.preferred_availability, preferred_date: @discover_flight.preferred_date } }
    end

    assert_redirected_to discover_flight_url(DiscoverFlight.last)
  end

  test "should show discover_flight" do
    get discover_flight_url(@discover_flight)
    assert_response :success
  end

  test "should get edit" do
    get edit_discover_flight_url(@discover_flight)
    assert_response :success
  end

  test "should update discover_flight" do
    patch discover_flight_url(@discover_flight), params: { discover_flight: { aircraft: @discover_flight.aircraft, alternate_date: @discover_flight.alternate_date, comments: @discover_flight.comments, email: @discover_flight.email, first_name: @discover_flight.first_name, last_name: @discover_flight.last_name, phone: @discover_flight.phone, preferred_availability: @discover_flight.preferred_availability, preferred_date: @discover_flight.preferred_date } }
    assert_redirected_to discover_flight_url(@discover_flight)
  end

  test "should destroy discover_flight" do
    assert_difference("DiscoverFlight.count", -1) do
      delete discover_flight_url(@discover_flight)
    end

    assert_redirected_to discover_flights_url
  end
end
