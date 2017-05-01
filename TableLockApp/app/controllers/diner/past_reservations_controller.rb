class Diner::PastReservationsController < ApplicationController
  before_action :require_diner
  protect_from_forgery
  def past_reservations
      #change to session
      @diner_id=session[:diner_id]
      @past_reservations=[]
      @set=0

      @reservations=Reservation.where("diner_id =? and reservation_status=0","#{@diner_id}")
      @reservations.each do |res|

        @ts=res.time_slot
        puts  @ts.time.utc.strftime("%H:%M:%S")
        puts Time.now.strftime("%H:%M:%S")
        puts @ts.date==Date.today && @ts.time.strftime("%H:%M:%S")>=Time.now.strftime("%H:%M:%S")
        if @ts.date==Date.today && @ts.time.strftime("%H:%M:%S")>=Time.now.strftime("%H:%M:%S")
          puts "herenow"
          next
        end
        if @ts.date<=Date.today
          puts Time.now


            @past_reservations<<res
          end

        end




  end
  def search
    @set=1

    @diner_id=session[:diner_id]
    @past_reservations=[]
    if params[:search_by].to_i==1
      @reservations=Reservation.where("diner_id =? and reservation_status=0","#{@diner_id}")
      @reservations.each do |res|
        @ts=res.time_slot

        if @ts.date<= Date.today && res.restaurant.restaurant_name.downcase.include?(params[:restaurant_search].downcase)
          puts "here"
          if @ts.date==Date.today && @ts.time.strftime("%H:%M:%S")>=Time.now.strftime("%H:%M:%S")
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
        if params[:date_search]!=""
          d=Date.strptime(params[:date_search],'%m/%d/%Y')
        else
          d=Date.today
        end

        if @ts.date<= Date.today &&@ts.date== d
          if @ts.date==Date.today && @ts.time.strftime("%H:%M:%S")>=Time.now.strftime("%H:%M:%S")
            next
          else

            @past_reservations<<res
          end

        end

      end
    end
    render "past_reservations"
  end

  def add_to_favourites

    @id=session[:diner_id]
    Favourite.where(diner_id: @id, restaurant_id: params[:id]).first_or_create
    redirect_to '/diner/favourites'
  end
end
