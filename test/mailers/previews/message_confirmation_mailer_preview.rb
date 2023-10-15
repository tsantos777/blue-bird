# Preview all emails at http://localhost:3000/rails/mailers/message_confirmation_mailer
class MessageConfirmationMailerPreview < ActionMailer::Preview

  def new_message
    message = Message.last
    MessageConfirmationMailer.message_confirmation_email(message)
  end

end
