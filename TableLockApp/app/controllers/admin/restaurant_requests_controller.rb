class Admin::RestaurantRequestsController < ApplicationController
  before_action :require_admin
  def view_requests
      @restaurant_request=RestaurantRequest.where("status = 2 or status is null")


  end
  def accept
    #changing the status value
    @restaurant_request=RestaurantRequest.find_by_id(params[:id])
    @restaurant_request.status=1
    @restaurant_request.save!
    restaurant=@restaurant_request.restaurant
    user=restaurant.user
    SignUpMailer.accept_email(user).deliver_now
    redirect_to '/admin/view_requests'



  end
  def reject

    @restaurant_request=RestaurantRequest.find_by_id(params[:id])
    @restaurant_request.status=2
    @restaurant_request.save!
    restaurant=@restaurant_request.restaurant
    user=restaurant.user
    SignUpMailer.reject_email(user).deliver_now
      redirect_to '/admin/view_requests'



  end

  def view
    @restaurant_request=RestaurantRequest.find(params[:req_id])

  end

end
