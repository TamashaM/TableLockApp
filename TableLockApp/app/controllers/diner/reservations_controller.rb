class Diner::ReservationsController < ApplicationController
  protect_from_forgery
  def reservations
    #change to session
    @diner_id=1
    @past_reservations=[]

    @reservations=Reservation.where("diner_id =? and reservation_status=0","#{@diner_id}")
    @reservations.each do |res|
      @ts=res.time_slot
      if @ts.date>= Date.today
        if @ts.date==Date.today && @ts.time< Time.now
            next
        else

          @past_reservations<<res
        end

      end

    end
    puts Date.today

  end

  def search
    #change to session
    @diner_id=1
    @past_reservations=[]
    if params[:search_by].to_i==1
      @reservations=Reservation.where("diner_id =? and reservation_status=0","#{@diner_id}")
      @reservations.each do |res|
        @ts=res.time_slot

        if @ts.date>= Date.today && res.restaurant.restaurant_name.downcase.include?(params[:restaurant_search].downcase)
          puts "here"
          if @ts.date==Date.today && @ts.time< Time.now
            next
          else
            @past_reservations<<res
          end

        end

      end
    elsif params[:search_by].to_i==2

      @reservations=Reservation.where("diner_id =? and reservation_status=0","#{@diner_id}")
      @reservations.each do |res|
        @ts=res.time_slot

        if @ts.date>= Date.today &&@ts.date== Date.strptime(params[:date_search],'%m/%d/%Y')
          if @ts.date==Date.today && @ts.time< Time.now
            next
          else

            @past_reservations<<res
          end

        end

      end
    end
    render "reservations"
  end

  def cancel
    @reservation=Reservation.find(params[:id])
    @reservation.reservation_status=1
    @reservation.save!

    @notification=Notification.new
    @notification.user_id=@reservation.restaurant.user.id
    @notification.message="Reservation cancellation at "+@reservation.time_slot.time.strftime("%H:%M") + " on " + @reservation.time_slot.date.strftime('%d %m %Y')
    @notification.checked=false
    @notification.save!

    waitings=@reservation.time_slot.waitings
    if !waitings.empty?
        waitings.each do |w|
          @notification=Notification.new
          @notification.user_id=w.diner.user_id
          @notification.message="You can now make your reservation for "+ @reservation.restaurant.restaurant_name+ " on "+ @reservation.time_slot.time.strftime("%H:%M") + " at " + @reservation.time_slot.date.strftime('%d %m %Y')
          @notification.checked=false
          @notification.save!
        end
    end
    redirect_to :controller=>'diner/reservations',:action=>'reservations'

  end
end
