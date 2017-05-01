class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]

  end
  def require_diner
    if !current_user
      flash["notice"]="Please Login"
      redirect_to '/login' unless current_user
    elsif @current_user.user_type!=0
      render :file => 'public/404.html', :status => :not_found, :layout=>false
    end


  end
  def require_restaurant
    if !current_user
      flash["notice"]="Please Login"
      redirect_to '/login' unless current_user
    elsif @current_user.user_type!=1
      render :file => 'public/404.html', :status => :not_found, :layout=>false
    end

  end
  def require_admin
    if !current_user
      flash["notice"]="Please Login"
      redirect_to '/login' unless current_user
    elsif @current_user.user_type!=2
      render :file => 'public/404.html', :status => :not_found, :layout=>false
    end
  end

  #this part is from tutorial remove if needed
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
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
