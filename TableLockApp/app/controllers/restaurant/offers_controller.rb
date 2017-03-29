class Restaurant::OffersController < ApplicationController
  protect_from_forgery

  def new
    @offer=Offer.new
  end
  def show
    @restaurant=Restaurant.find(session[:restaurant_id])
    @offers=@restaurant.offers

  end
  def create
    @offer = Offer.new(offer_params)
    puts @offer.start_date
    puts @offer.end_date
    #should be changed to session[:restaurant_id]
    @restaurant=Restaurant.find(3)

    if @restaurant.offers<<@offer
      redirect_to '/restaurant/offers'
    else
      redirect_to(:back)
    end
  end
  private
  def offer_params
    params.require(:offer).permit(:name, :description, :start_date, :start_time, :end_date, :end_time)
  end
end
