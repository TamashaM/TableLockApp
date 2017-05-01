class Diner::ReservationsController < ApplicationController
  protect_from_forgery
  def reservations
    #change to session
    @set=0
    @diner_id=session[:diner_id]
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
    @diner_id=session[:diner_id]
    @set=1
    @past_reservations=[]
    if params[:search_by].to_i==1
      @reservations=Reservation.where("diner_id =? and reservation_status=0","#{@diner_id}")
      @reservations.each do |res|
        @ts=res.time_slot
        puts "here"

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
        puts params[:date_search]
        if params[:date_search]!=""
          d=Date.strptime(params[:date_search],'%m/%d/%Y')
        else
          d=Date.today
        end
        if @ts.date>= Date.today && @ts.date== d
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
    @message="Your reservation for "+ @reservation.restaurant.restaurant_name+ " at "+@reservation.time_slot.time.strftime("%H:%M") + " on " + @reservation.time_slot.date.strftime('%d %m %Y')+" has been cancelled."
    AgentTexter.alert(@notification.message,@reservation.diner.telephone).deliver

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
