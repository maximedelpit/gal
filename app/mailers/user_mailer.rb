class UserMailer < ApplicationMailer
  def welcome_email()
    mail(from: ENV['MAILJET_FROM_EMAIL'], to: "maximedelpit@gmail.com",
        subject: "This is a nice welcome email")
  end
end
