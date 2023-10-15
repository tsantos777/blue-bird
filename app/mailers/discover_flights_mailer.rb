class DiscoverFlightsMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def discover_flights_email(discover_flight)
    @discover_flight = discover_flight

    mail(to: @discover_flight.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Discovery Flight at Ideal Aviation")
  end


end
