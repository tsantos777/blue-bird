class CheckoutEmailMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def checkout_email(checkout)
    @checkout = checkout

    mail(to: @checkout.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Ideal Aviation Aircraft Checkout Request")
  end


end
