class Admin::RestaurantRequestsController < ApplicationController
  def view_requests
      @restaurant_request=RestaurantRequest.all


  end
  def accept
    #changing the status value
    @restaurant_request=RestaurantRequest.find_by_id(params[:id])
    @restaurant_request.status=1
    @restaurant_request.save!

    #creating the user object


    redirect_to '/admin/view_requests'



  end
  def reject

    @restaurant_request=RestaurantRequest.find_by_id(params[:id])
    @restaurant_request.status=2
    @restaurant_request.save!
      redirect_to '/admin/view_requests'



  end

end
