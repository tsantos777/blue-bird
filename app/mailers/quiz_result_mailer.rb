class QuizResultMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def quiz_result_email(quiz_result)
    @quiz_result = quiz_result

    mail(to: @quiz_result.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Thanks for Taking Our Quiz!")
  end



end
