class Restaurant::RestaurantRequestsController < ApplicationController
  protect_from_forgery
  def create
    @restaurant_request=RestaurantRequest.new
    @restaurant_request.first_name=params[:first_name]
    @restaurant_request.last_name=params[:last_name]
    @restaurant_request.telephone=params[:telephone]
    @restaurant_request.position=params[:position].to_i
    @restaurant_request.restaurant_name=params[:restaurant_name]
    @restaurant_request.city=params[:city]
    @restaurant_request.province=params[:province]
    @restaurant_request.add_line1=params[:add_line1]
    @restaurant_request.add_line2=params[:add_line2]
    @restaurant_request.restaurant_id=params[:restaurant_id]
    if @restaurant_request.save!

      redirect_to '/login'
    else
      redirect_to '/signup_restaurant'
    end
  end
end
