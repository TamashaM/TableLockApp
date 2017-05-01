class Restaurant::ReservationsController < ApplicationController
  before_action :require_restaurant
  protect_from_forgery
  def mark_status
    @reservation=Reservation.find(params[:id])
    @diner_history=@reservation.diner.diner_history
    if !@reservation.customer_status.nil?
      @val=@reservation.customer_status
      if @val==0
        @diner_history.on_time_count-=1
      elsif @val==1
        @diner_history.delay_count-=1
      elsif @val==2
        @diner_history.no_show_count-=1
      end

    end
    if params[:value].to_i==0
      @reservation.customer_status=0
      @reservation.save!
      @diner_history.on_time_count+=1
      @diner_history.save!
    elsif params[:value].to_i==1
      @reservation.customer_status=1
      @reservation.save!
      @diner_history.delay_count+=1
      @diner_history.save!
    elsif params[:value].to_i==2

      @reservation.customer_status=2
      @reservation.save!
      @diner_history.no_show_count+=1
      @diner_history.save
    end
    redirect_to :controller=>'restaurant/reservations',:action=>'view_reservations',:date=>@reservation.time_slot.date


  end
  def cancel
    @reservation=Reservation.find(params[:id])
    @reservation.reservation_status=1
    @reservation.save!
    redirect_to :controller=>'restaurant/reservations',:action=>'view_reservations',:date=>@reservation.time_slot.date


  end
  def view_reservations

    @id=session[:restaurant_id]

    if request.post?

      @date=Date.strptime(params[:date],'%m/%d/%Y')
      @time_slots=TimeSlot.where("date=? and restaurant_id=? ","#{@date}","#{@id}")
      @reservations =[]
      @time_slots.each do |ts|
        @r=ts.reservations.where("reservation_status=?","#{0}")

        @reservations.concat(@r)
      end

    else
      @date=params[:date]
      @time_slots=TimeSlot.where("date=? and restaurant_id=? ","#{@date}","#{@id}")
      @reservations =[]
      @time_slots.each do |ts|
        @r=ts.reservations.where("reservation_status=?","#{0}")

        @reservations.concat(@r)
      end



    end


  end

end
