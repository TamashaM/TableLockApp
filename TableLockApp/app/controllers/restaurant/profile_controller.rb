class Restaurant::ProfileController < ApplicationController
  protect_from_forgery
  def view

    @restaurant=Restaurant.find(session[:restaurant_id])

  end
  def update
    @restaurant=Restaurant.find(session[:restaurant_id])

      puts @restaurant.attributes
      if @restaurant.update_attributes(restaurant_params)
        flash[:success]="Profile updated successfully"
        redirect_to '/restaurant/profile'
      else
        @restaurant.errors.full_messages.each do |message|
          flash[:error]=message
        end
        # flash[:error]="Error updating profile"
        redirect_to '/restaurant/profile'
      end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit( :restaurant_name, :telephone, :add_line1, :add_line2,:city,:province)
  end
end
