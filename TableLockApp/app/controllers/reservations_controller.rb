class ReservationsController < ApplicationController
  protect_from_forgery

  def add
    @restaurant=Restaurant.find(params[:restaurant_id])
    create_time_slot
    @tss=TimeSlot.where("date=? and time=? and restaurant_id=?","#{params[:date]}","#{params[:time].to_time.strftime("%H:%M:%S")}","#{params[:restaurant_id]}" )
    @ts=@tss.first
    @ts.reservation_count=@ts.reservation_count+params[:packs].to_i
    @ts.save!

    @reservation=Reservation.new
    @reservation.time_slot_id=@ts.id
    @reservation.restaurant_id=params[:restaurant_id]
    #change to session
    @reservation.diner_id=1
    @reservation.packs=params[:packs]
    @reservation.meal_type_id=params[:meal_type]
    @reservation.reservation_status=0

    @notification=Notification.new
    @notification.user_id=@reservation.restaurant.user.id
    @notification.message="You have a new reservation at "+@reservation.time_slot.time.strftime("%H:%M") + " on " + params[:date]
    @notification.checked=false
    @notification.save!

    if @reservation.save!
      redirect_to '/diner/reservations'
    else
      redirect_to(:back)
    end


  end
  def create_time_slot


    @tss=TimeSlot.where("date=? and time=? and restaurant_id=?","#{params[:date]}","#{params[:time].to_time.strftime("%H:%M:%S")}","#{params[:restaurant_id]}" )
    if @tss.empty?
      @ts= TimeSlot.new(time_slot_params)
      @ts.reservation_count=0

      @ts.save!
    end
  end

  private
  def time_slot_params
    params.permit(:date, :time, :restaurant_id, :diner_id)
  end

end
