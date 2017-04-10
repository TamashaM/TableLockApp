class Diner::SearchReservationController < ApplicationController
  protect_from_forgery
def view

  @key=params[:key]
  @date=Date.strptime(params[:date],'%m/%d/%Y')
  puts @date
  @time=params[:time]
  @packs=params[:packs]
  if (@key.blank?)

  else
    @restaurants=Restaurant.joins("RIGHT OUTER JOIN dining_informations ON restaurants.id = dining_informations.restaurant_id").where("restaurant_name LIKE ? OR city LIKE ? OR province LIKE ?","%#{@key}%","%#{@key}%","%#{@key}%")

    @tss=[]
    @restaurants.each do |r|
       puts r.restaurant_name
      @restts=[]
      # puts r.restaurant_name
      @time_slots = Array.new(20)
      @day=@date.wday
       puts @day
      # @restaurants.reject!{ |r| r.dining_information.nil? }
      # if r.dining_information.nil?
      #   next
      # end
      @time_seating=r.dining_information.time_seating

      @tps=r.time_periods.where(week_day: @day)


      @tps.each do |tp|
        @start=tp.start_time.strftime("%H:%M")
        @end=tp.end_time.strftime("%H:%M")
        if (@start..@end).cover? @time

          @p=tp.start_time
          @time_slots[0]=@p
          @i=1
          while @p+@time_seating*60 <= tp.end_time-@time_seating*60  do
            @time_slots[@i]=@p+@time_seating*60
            @p=@p+@time_seating*60

            @i=@i+1


          end

            @point=0;
            for i in 0..18
              if @time_slots[i+1]!=nil && @time_slots[i].strftime("%H:%M")<= @time &&@time_slots[i+1].strftime("%H:%M")>@time

                @point=i
                puts @time_slots[i]
              end
            end
          @min=0
          @max=0
          if @point-1<=0
            @min=0
          elsif @point-2<0
            @min=1
          else
            @min=@point-2
          end

          if @point+1>=@i-1
              @max=@i-1
          elsif @point+2>@i-1
             @max=@i-2
          else
            @max=@point+2
          end
          #change this

          for j in @min..@max
            @restts<<@time_slots[j].strftime("%H:%M")
            puts @time_slots[j]
          end

        end
      end


    @tss[r.id]=@restts
    end

  end

  render 'view'

end

  def add
    @id=params[:id]
    @restaurant=Restaurant.find(@id)
    @time_slot=params[:ts]
    @date=params[:date]
    @packs=params[:packs]
  end

end
