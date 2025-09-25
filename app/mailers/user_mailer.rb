class UserMailer < ApplicationMailer
  default from: "no-reply@activenow.com"

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/projects"
    mail(to: @user.email, subject: "Witaj w naszej aplikacji 🚀")
  end
end
