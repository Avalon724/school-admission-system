# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/student_added
  def student_added
    StudentMailer.with(user: "test@test.com").student_added
  end
end
