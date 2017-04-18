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

    if !@restaurants.empty?
      @restaurants.each do |r|
         puts r.restaurant_name
        @restts=[[],[]]
        # puts r.restaurant_name
        @time_slots = Array.new(20)
         if r.holidays.any? {|h| h.date == @date}
           puts "found a holiday"
           next
         end
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
            puts @min

            puts @max


            for j in @min..@max

              @db_ts=r.time_slots.where("date=? and time=?","#{@date}","#{@time_slots[j].strftime("%H:%M:%S")}" )
              if @db_ts.empty?
                if r.dining_information.capacity_seating>=@packs.to_i
                  puts @time_slots[j].strftime("%H:%M")
                  @restts.push([@time_slots[j].strftime("%H:%M"),0])
                end
              else
                @count=@db_ts.first.reservation_count + @packs.to_i

                if @count<=r.dining_information.capacity_seating
                  puts @time_slots[j].strftime("%H:%M")
                  @restts.push([@time_slots[j].strftime("%H:%M"),0])
                else
                  puts @time_slots[j].strftime("%H:%M")
                  @restts.push([@time_slots[j].strftime("%H:%M"),1])

                end
              end

              #puts @time_slots[j]
            end

          end
        end


      @tss[r.id]=@restts
      end
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

  def add_to_waiting_list


    if request.post?
      @tss=TimeSlot.where("date=? and time=? and restaurant_id=?","#{params[:date]}","#{params[:time].to_time.strftime("%H:%M:%S")}","#{params[:restaurant_id]}" )
      @ts=@tss.first
      @entry=Waiting.new
      @entry.time_slot_id=@ts.id
      #change to session
      @entry.diner_id=1
      @entry.save!
      redirect_to '/diner/home'
    else
      @id=params[:id]
      @restaurant=Restaurant.find(@id)
      @time_slot=params[:ts]
      @date=params[:date]
      @packs=params[:packs]
    end
  end

end
