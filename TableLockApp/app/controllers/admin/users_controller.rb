class Admin::UsersController < ApplicationController
  protect_from_forgery
  def new
    @user=User.new

  end
  def create
    @user = User.new(user_params)
    if @user.save!
      @user_id=@user.id
      if params[:user][:user_type].to_i==0

          @diner=Diner.new
          @diner.user_id=@user.id
          @diner.first_name=params[:user][:first_name]
          @diner.last_name=params[:user][:last_name]
          @diner.telephone=params[:user][:telephone]
          if @diner.save!
                session[:user_id]=@user.id
                redirect_to '/welcome/index'
          else
                redirect_to '/login/signup_diner'
          end
      else
        #creating  restaurant request object and sending them rr controller
        @restaurant=Restaurant.new
        #@restaurant=Restaurant.new(params[:user])
        @restaurant.user_id=@user.id
        @restaurant.first_name=params[:user][:first_name]
        @restaurant.last_name=params[:user][:last_name]
        @restaurant.telephone=params[:user][:telephone]
        @restaurant.restaurant_name=params[:user][:restaurant_name]
        @restaurant.city=params[:user][:city]
        @restaurant.province=params[:user][:province]
        @restaurant.position=params[:user][:position]
        if @restaurant.save!
          session[:user_id]=@user.id
          redirect_to controller:'restaurant/restaurant_requests',
                      action:'create',
                      first_name: @restaurant.first_name,
                      last_name:@restaurant.last_name,
                      telephone:@restaurant.telephone,
                      city:@restaurant.city,
                      province:@restaurant.province,
                      position:params[:user][:position],
                      restaurant_name:@restaurant.restaurant_name,
                      user_id:@user.id,
                      email:@user.email
        else
          redirect_to '/login/signup_diner'
        end
      end


    else
        redirect_to '/login/signup_diner'

    end
  end


  private
    def user_params
      params.require(:user).permit(:email, :password, :user_type)
    end


end
