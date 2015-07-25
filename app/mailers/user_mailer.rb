class UserMailer < ApplicationMailer
  default from: "my.personal.library.helper@gmail.com"

  def password_reset_email(user)
    @user = user
    @url = 'http://www.google.com'
    mail(to: @user.email, subject: 'Password Reset')
  end
end
