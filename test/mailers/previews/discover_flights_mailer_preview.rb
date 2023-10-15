# Preview all emails at http://localhost:3000/rails/mailers/discover_flights_mailer
class DiscoverFlightsMailerPreview < ActionMailer::Preview

  def new_discover_flight
    discover_flight = DiscoverFlight.last
    DiscoverFlightsMailer.discover_flights_email(discover_flight)
  end

end
