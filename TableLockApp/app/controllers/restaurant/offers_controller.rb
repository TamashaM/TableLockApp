class Restaurant::OffersController < ApplicationController
  before_action :require_restaurant
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
    sd= params[:offer][:start_date]
    ed=params[:offer][:end_date]
    st=params[:offer][:start_time]
    et=params[:offer][:end_time]
    puts @offer.start_date
    puts @offer.end_date
    if sd>ed
      flash[:error]="End date should come after start date"
      redirect_to(:back)
    elsif sd==ed && st>=et
      flash[:error]="End time should come after start time"
      redirect_to(:back)

    else
    #should be changed to session[:restaurant_id]
      @restaurant=Restaurant.find(session[:restaurant_id])

      if @restaurant.offers<<@offer
        flash[:success]="Offer added successfully"
        redirect_to '/restaurant/offers'
      else
        flash[:error]="Error adding offer"
        redirect_to(:back)
      end
    end

  end
  def remove
    Offer.find(params[:id]).destroy
    flash[:success]="Offer removed successfully"
    redirect_to '/restaurant/offers'
  end
  private
  def offer_params
    params[:offer][:start_date]=Date.strptime(params[:offer][:start_date],'%m/%d/%Y')
    params[:offer][:end_date]=Date.strptime(params[:offer][:end_date],'%m/%d/%Y')
    params.require(:offer).permit(:name, :description, :start_date, :start_time, :end_date, :end_time)
  end
end
