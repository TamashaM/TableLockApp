class Restaurant::ProfileController < ApplicationController
  protect_from_forgery
  def view

    @restaurant=Restaurant.find(session[:restaurant_id])

  end
  def update
    @restaurant=Restaurant.find(3)


      if @restaurant.update_attributes(restaurant_params)
        redirect_to '/restaurant/reservations'
      else
        render('view')
      end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit( :restaurant_name, :telephone, :add_line1, :add_line2,:city,:province)
  end
end
