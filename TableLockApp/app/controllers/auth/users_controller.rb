class Auth::UsersController < ApplicationController
  protect_from_forgery
  def new
    @user=User.new

  end
  def create
    @user = User.new(user_params)
    #create user
    if @user.save
      @user_id=@user.id
      if params[:user][:user_type].to_i==0
          #create diner
          @diner=Diner.new
          @diner.user_id=@user.id
          @diner.first_name=params[:user][:first_name]
          @diner.last_name=params[:user][:last_name]
          @diner.telephone=params[:user][:telephone]
          if @diner.save
            #uncomment this
                SignUpMailer.welcome_email(@user).deliver_now

                session[:user_id]=@user.id
                session[:diner_id]=@diner.id
                flash[:success]="You have successfully signed in with TableLock "
                redirect_to '/diner/home'
          else
            @diner.errors.full_messages.each do |message|
              flash[:error]=message
            end
            # flash[:error]="Error processing the request. Please signup again "
            redirect_to '/login/signup_diner'
          end
      elsif params[:user][:user_type].to_i==1
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
        @restaurant.add_line1=params[:user][:add_line1]
        @restaurant.add_line2=params[:user][:add_line2]
        if @restaurant.save
          SignUpMailer.request_email(@user).deliver_now
          flash[:success]="Your request was submitted successfully "
          session[:user_id]=@user.id
          session[:restaurant_id]=@restaurant.id
          redirect_to controller:'restaurant/restaurant_requests',
                      action:'create',
                      first_name: @restaurant.first_name,
                      last_name:@restaurant.last_name,
                      telephone:@restaurant.telephone,
                      city:@restaurant.city,
                      province:@restaurant.province,
                      position:params[:user][:position],
                      restaurant_name:@restaurant.restaurant_name,
                      restaurant_id:@restaurant.id,
                      add_line1:@restaurant.add_line1,
                      add_line2:@restaurant.add_line2,
                      email:@user.email
        else
          #flash[:error]="Error submitting the request"
          @restaurant.errors.full_messages.each do |message|
            flash[:error]=message
          end

          redirect_to '/login/signup_restaurant'
        end
      elsif params[:user][:user_type].to_i==2
        @admin=Admin.new
        @admin.user_id=@user.id
        @admin.first_name=params[:user][:first_name]
        @admin.last_name=params[:user][:last_name]
        @admin.telephone=params[:user][:telephone]
        if @admin.save
          session[:user_id]=@user.id
          session[:admin_id]=@admin.id
          flash[:success]="You have successfully signed in with TableLock "
          redirect_to '/admin/home'
        else
          @admin.errors.full_messages.each do |message|
            flash[:error]=message
          end
          # flash[:error]="Error processing the request. Please signup again "
          redirect_to '/admin/signup'

        end
      end


    else
      @user.errors.full_messages.each do |message|
        flash[:error]=message
      end

      redirect_to (:back)

    end
  end


  private
    def user_params
      params.require(:user).permit(:email, :password, :user_type)
    end


end
