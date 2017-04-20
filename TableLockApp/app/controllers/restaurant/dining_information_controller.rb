class Restaurant::DiningInformationController < ApplicationController
  protect_from_forgery
  def view

    @restaurant=Restaurant.find(session[:restaurant_id])
    if @restaurant.dining_information
      @dining_information=@restaurant.dining_information
    end
    @meal_types=@restaurant.meal_types

  end
  def update
    @restaurant=Restaurant.find(3)
    @restaurant.about=params[:profile][:about]
    @restaurant.save
    if @restaurant.dining_information
      if @restaurant.dining_information.update_attributes(profile_params)
        redirect_to (:back)
      else
        render('view')
      end


    else
      @dining_info=DiningInformation.new(profile_params)
      if @restaurant.dining_information=@dining_info
        redirect_to (:back)
      else
        render('view')
      end
    end


  end
  def add_meal_type
    meal_type=MealType.new
    #change to session
    meal_type.restaurant_id=3
    meal_type.title=params[:mt][:title]
    meal_type.price=params[:mt][:price]
    meal_type.start_time=params[:mt][:start_time]
    meal_type.end_time=params[:mt][:end_time]
    meal_type.save!
    redirect_to '/restaurant/dining_information'
  end
  def remove_meal_type
    MealType.find(params[:id]).destroy
    redirect_to '/restaurant/dining_information'
  end
  private
  def profile_params
    params.require(:profile).permit( :dining_style, :phone_number, :cuisines, :website,:add_info,:dress_code ,:capacity_seating,:time_seating)
  end
end
