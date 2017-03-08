class RestaurantRequestsController < ApplicationController
  protect_from_forgery
  def create
    @restaurant_request=RestaurantRequest.new
    @restaurant_request.first_name=params[:rr][:first_name]
    @restaurant_request.last_name=params[:rr][:last_name]
    @restaurant_request.telephone=params[:rr][:telephone]
    @restaurant_request.position=params[:rr][:position].to_i
    @restaurant_request.restaurant_name=params[:rr][:restaurant_name]
    @restaurant_request.city=params[:rr][:city]
    @restaurant_request.province=params[:rr][:province]
    if @restaurant_request.save!

      redirect_to '/welcome/index'
    else
      redirect_to '/signup_restaurant'
    end
  end
end
