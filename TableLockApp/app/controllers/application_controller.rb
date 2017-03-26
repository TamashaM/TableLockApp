class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||=User.find(session[:user_id])

  end
  def require_user
    redirect_to '/login' unless current_user
  end

  #this part is from tutorial remove if needed

  private
  def confirmed_logged_in
    unless session[:user_id]
      redirect_to '/login'
      return false
    else
      return true
    end

  end
end
