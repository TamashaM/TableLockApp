class SignUpMailer < ApplicationMailer
  default from: 'tablelockdine@gmail.com'

  def welcome_email(user)
    @user = user
    @diner=Diner.find_by_user_id(@user.id)
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to TableLock!')
  end
end
