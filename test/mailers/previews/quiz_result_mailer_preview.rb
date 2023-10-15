# Preview all emails at http://localhost:3000/rails/mailers/quiz_result_mailer
class QuizResultMailerPreview < ActionMailer::Preview

  def new_quiz_result
    quiz_result = QuizResult.last
    QuizResultMailer.quiz_result_email(quiz_result)
  end

end
