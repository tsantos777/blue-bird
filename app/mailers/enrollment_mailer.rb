class EnrollmentMailer < ApplicationMailer

  default from: 'no-reply@simplifly-co.com'

  def enrollment_email(message)
    @message = message

    mail(to: @message.email, bcc: ["no-reply@simplifly-co.com", "info@simpliflyco.com"], subject: "✈️ Application to Enroll at SimpliFly")
  end


end
