class UserMailer < ActionMailer::Base
  default from: "angmorozz@gmail.com"
  def welcome_email(current_user)
    @user = current_user
    @url  = 'http://gmail.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end