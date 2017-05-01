class SignUpMailer < ApplicationMailer
  default from: 'tablelockdine@gmail.com'

  def welcome_email(user)
    @user = user
    if @user.user_type==0
      @diner=Diner.find_by_user_id(@user.id)
    else
      @admin=Admin.find_by_user_id(@user.id)
    end
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to TableLock!')
  end
  def request_email(user)
    @user = user
    @restaurant=Restaurant.find_by_user_id(@user.id)
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to TableLock!')
  end
  def reject_email(user)
    @user = user
    @restaurant=Restaurant.find_by_user_id(@user.id)
    @url  = 'http://localhost:3000/signup_restaurant'
    mail(to: @user.email, subject: 'Request Rejected!')
  end
  def accept_email(user)
    @user = user
    @restaurant=Restaurant.find_by_user_id(@user.id)
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Request Accepted!')
  end



end
