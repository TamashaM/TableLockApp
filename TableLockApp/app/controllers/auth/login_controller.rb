class Auth::LoginController < ApplicationController
  def new

  end
  def create
    @user=User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password]) && @user.user_type==params[:session][:user_type].to_i
      session[:user_id]=@user.id
      #checking the use type and redirect to their home page with the id
      if @user.user_type==0
        redirect_to controller:'/diner/home',
                    action:'home',
                    id: @user.id
      end

    else
      redirect_to '/login'

    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to '/'
  end
end
