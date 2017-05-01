class Restaurant::DiningInformationController < ApplicationController
  before_action :require_restaurant
  protect_from_forgery
  def view

    @restaurant=Restaurant.find(session[:restaurant_id])
    if @restaurant.dining_information
      @dining_information=@restaurant.dining_information
    else
      @di=DiningInformation.new
      @di.restaurant_id=session[:restaurant_id]
      @di.save!
    end
    @meal_types=@restaurant.meal_types

  end
  def update
    @restaurant=Restaurant.find(session[:restaurant_id])
    @restaurant.about=params[:profile][:about]
    if @restaurant.save
      if @restaurant.dining_information
        if @restaurant.dining_information.update_attributes(profile_params)
          flash[:success]="Data updated sucessfully"
           redirect_to '/restaurant/dining_information'
        else
          @restaurant.dining_information.errors.full_messages.each do |message|
            flash[:error]=message
          end
          redirect_to (:back)
        end

      else
        @dining_info=DiningInformation.new(profile_params)
        if @restaurant.dining_information=@dining_info
          redirect_to 'restaurant/dining_information'
        else
          redirect_to (:back)
        end
      end
    else
      @restaurant.errors.full_messages.each do |message|
        flash[:error]=message
      end
      redirect_to (:back)
    end



  end
  def add_meal_type
    meal_type=MealType.new
    #change to session
    meal_type.restaurant_id=session[:restaurant_id]
    meal_type.title=params[:mt][:title]
    meal_type.price=params[:mt][:price]
    meal_type.start_time=params[:mt][:start_time]
    meal_type.end_time=params[:mt][:end_time]
    meal_type.save!
    flash[:success]="Meal type added successfully"
    redirect_to '/restaurant/dining_information'
  end
  def remove_meal_type
    MealType.find(params[:id]).destroy
    flash[:success]="Meal type removed successfully"
    redirect_to '/restaurant/dining_information'
  end
  private
  def profile_params
    params.require(:profile).permit( :dining_style, :phone_number, :cuisines, :website,:add_info,:dress_code ,:capacity_seating,:time_seating)
  end
end
