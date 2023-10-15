# Preview all emails at http://localhost:3000/rails/mailers/checkout_email_mailer
class CheckoutEmailMailerPreview < ActionMailer::Preview

  def new_checkout
    checkout = Checkout.last
    CheckoutEmailMailer.checkout_email(checkout)
  end

end
