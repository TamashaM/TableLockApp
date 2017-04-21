class Admin::PaymentsController < ApplicationController
  protect_from_forgery
  def view

    if request.post?
      require 'set'
      month=params[:month]
      time_slots=TimeSlot.where('extract(month from date) = ?', "#{month}")
     # payments=Reservation.select(("restaurant_id , sum(payment_amount) as total_payment").where('extract(day   from date_column) = ?', desired_day_of_month).group("restaurant_id"))
      @records=[]
      @restaurants=Set.new
      time_slots.each do |ts|
        payments=ts.reservations.sum(:payment_amount)
        if @records[ts.restaurant_id].nil?
          @records[ts.restaurant_id]=0
        end
        @records[ts.restaurant_id]=@records[ts.restaurant_id]+payments
        @restaurants.add(ts.restaurant_id)
      end
    end

  end
end

