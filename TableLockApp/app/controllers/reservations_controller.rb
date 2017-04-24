class ReservationsController < ApplicationController
  protect_from_forgery except: [:hook]

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
    @reservation.diner_id=session[:diner_id]
    @reservation.packs=params[:packs]
    @reservation.meal_type_id=params[:meal_type]
    @reservation.reservation_status=0

    @notification=Notification.new
    @notification.user_id=@reservation.restaurant.user.id
    @notification.message="You have a new reservation at "+@reservation.time_slot.time.strftime("%H:%M") + " on " + params[:date]
    @notification.checked=false
    @notification.save!

    @message="You have made a reservation for "+ @reservation.restaurant.restaurant_name+" at "+@reservation.time_slot.time.strftime("%H:%M") + " on " + params[:date]

    AgentTexter.alert(@message, @reservation.diner.telephone).deliver

    if @reservation.save!
      if params[:reserve_type]=="0"
        redirect_to @reservation.paypal_url
      elsif params[:reserve_type]=="1"
        redirect_to '/diner/reservations'
      end


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


  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    puts "here1"
    if status == "Completed"
      puts "here2"
      @reservation = Reservation.find params[:invoice]
      @reservation.update_attributes notification_params: params.to_h, status: status, transaction_id: params[:txn_id], purchased_at: Time.now,payment_status:1,payment_amount: params[:payment_gross]
    end
    redirect_to '/diner/reservations'
  end

  private
  def time_slot_params
    params.permit(:date, :time, :restaurant_id, :diner_id)
  end

end
