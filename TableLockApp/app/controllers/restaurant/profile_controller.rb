class Restaurant::ProfileController < ApplicationController
  protect_from_forgery
  def view

    @restaurant=Restaurant.find(session[:restaurant_id])

  end
  def update
    @restaurant=Restaurant.find(3)
    @restaurant.about=params[:profile][:about]
    @restaurant.save
    if @restaurant.dining_information
      if @restaurant.dining_informaton.update_attributes(profile_params)
        redirect_to '/diner/reservations'
      else
        render('view')
      end


    else
      @dining_info=DiningInformation.new(profile_params)
      if @restaurant.dining_information=@dining_info
        redirect_to '/diner/reservations'
      else
        render('view')
      end
    end


    end
  private
  def profile_params
    params.require(:profile).permit( :dining_style, :phone_number, :cuisines, :website,:add_info,:dress_code)
  end
end
