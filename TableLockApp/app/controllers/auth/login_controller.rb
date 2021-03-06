class Auth::LoginController < ApplicationController
  #check whther the use is logged in except for the following methods
  before_action :confirmed_logged_in,
                :except=>[:login, :create,:logout]
  def new

  end

  def create

    if params[:session][:email].present? && params[:session][:password].present?
      @user=User.find_by_email(params[:session][:email])

      if @user && @user.authenticate(params[:session][:password])
        session[:user_id]=@user.id
        #Materialize.toast("you are now logged in",4000)
        flash[:success]="You are now logged in"
        #checking the use type and redirect to their home page with the id
        if @user.user_type==0
          @diner=Diner.find_by_user_id(@user.id)
          session[:diner_id]=@diner.id
         # flash[:success]="You are now logged in"
          redirect_to controller:'/diner/home',
                      action:'home',
                      id: @user.id
        elsif @user.user_type==1
          @restaurant=Restaurant.find_by_user_id(@user.id)
          @restaurant_request=RestaurantRequest.find_by_restaurant_id(@restaurant.id)
          if @restaurant_request.status==nil
            #restaurant req is still pending
            session[:status]=0
            redirect_to controller:'/restaurant/home',
            action:'pending'

          elsif @restaurant_request.status==1
            #restaurant req accepted
            session[:status]=1

            session[:restaurant_id]=@restaurant.id
            redirect_to controller:'/restaurant/reservations',
                        action:'view_reservations'
          else
            #restaurant req rejected
            session[:status]=2
            redirect_to controller:'/restaurant/home',
                        action:'reapply'
          end
          @restaurant=Restaurant.find_by_user_id(@user.id)
        elsif @user.user_type==2
          @admin=Admin.find_by_user_id(@user.id)
          session[:admin_id]=@admin.id

          redirect_to controller:'/admin/home',
                      action:'home',
                      id: @user.id


        end

      else

        flash[:error]="Invalid email,password combination"

        redirect_to(:back)

      end
    else
      redirect_to(:back)
    end

  end

  def destroy
    reset_session
    redirect_to '/login'
  end

end
