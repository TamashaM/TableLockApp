class Restaurant::HolidaysController < ApplicationController
  protect_from_forgery
  def view
    #change to session
    @restaurant=Restaurant.find(3)
    @holidays=@restaurant.holidays
  end

  def add
    @holiday=Holiday.new
    #change to session
    @holiday.restaurant_id=3
    puts params[:holiday]
    @holiday.date=Date.strptime(params[:holiday],'%m/%d/%Y')
    if @holiday.save!
      redirect_to :controller=>'restaurant/holidays',:action=>'view'

    else
      redirect_to (:back)
    end

  end
end
