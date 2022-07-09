class StudentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.student_added.subject
  #
  def student_added
    @email = params[:user]
    @greeting = "Hi"

    mail to: @email, subject: "Application for candidate recieved successfully"
  end
end
