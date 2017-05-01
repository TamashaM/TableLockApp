class Restaurant::HolidaysController < ApplicationController
  before_action :require_restaurant
  protect_from_forgery
  def view
    #change to session
    @restaurant=Restaurant.find(session[:restaurant_id])
    @holidays=@restaurant.holidays
  end

  def add
    @holiday=Holiday.new
    #change to session
    @holiday.restaurant_id=session[:restaurant_id]
   # puts params[:holiday]
    @holiday.date=Date.strptime(params[:holiday],'%m/%d/%Y')
    if @holiday.save!
      flash[:success]="Holiday added successfully"
      redirect_to :controller=>'restaurant/holidays',:action=>'view'

    else
      flash[:error]="Error in addning holiday"
      redirect_to (:back)
    end

  end
end
