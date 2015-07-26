class UserMailer < ApplicationMailer
  default from: "my.personal.library.helper@gmail.com"

  def password_reset_email(user)
    puts "we are in the user mailer"
    @user = user
    @url = 'http://www.google.com'
    mail(to: @user.email, subject: 'Password Reset')
  end
end
