class Restaurant::PublicProfileController < ApplicationController
  def view
    @restaurant=Restaurant.find(params[:restaurant_id])
    @dining_info=@restaurant.dining_information

    @monday=@restaurant.time_periods.where(week_day: '1')
    @tuesday=@restaurant.time_periods.where(week_day: '2')
    @wednesday=@restaurant.time_periods.where(week_day: '3')
    @thursday=@restaurant.time_periods.where(week_day: '4')
    @friday=@restaurant.time_periods.where(week_day: '5')
    @saturday=@restaurant.time_periods.where(week_day: '6')
    @sunday=@restaurant.time_periods.where(week_day: '0')

    @offers=@restaurant.offers
    @meal_types=@restaurant.meal_types
  end
end
