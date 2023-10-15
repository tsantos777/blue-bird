# Preview all emails at http://localhost:3000/rails/mailers/enrollment_mailer
class EnrollmentMailerPreview < ActionMailer::Preview

  def new_enrollment
    message = Enrollment.last
    EnrollmentMailer.enrollment_email(message)
  end

end
