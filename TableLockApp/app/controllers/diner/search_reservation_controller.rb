class Diner::SearchReservationController < ApplicationController
  before_action :require_diner
  protect_from_forgery
  def view
    @key=params[:key]
    if params[:date]
      @date=Date.strptime(params[:date],'%m/%d/%Y')
    end

    puts @date
    @time=params[:time]
    @packs=params[:packs]
    @category=params[:restaurant_category]
    if @category=="restaurant"
      @restaurant=Restaurant.find(params[:restaurant_id])
      @restts=[[],[]]
      # puts r.restaurant_name
      @time_slots = Array.new(20)
      if @restaurant.holidays.any? {|h| h.date == @date}
        puts "found a holiday"

      else
        @day=@date.wday
        @time_seating=@restaurant.dining_information.time_seating
        @tps=@restaurant.time_periods.where(week_day: @day)
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
              @db_ts=@restaurant.time_slots.where("date=? and time=?","#{@date}","#{@time_slots[j].strftime("%H:%M:%S")}" )
              if @db_ts.empty?
                if @restaurant.dining_information.capacity_seating>=@packs.to_i
                  puts @time_slots[j].strftime("%H:%M")
                  @restts.push([@time_slots[j].strftime("%H:%M"),0])
                end
              else
                @count=@db_ts.first.reservation_count + @packs.to_i
                if @count<=@restaurant.dining_information.capacity_seating
                  puts @time_slots[j].strftime("%H:%M")
                  @restts.push([@time_slots[j].strftime("%H:%M"),0])
                else
                  puts @time_slots[j].strftime("%H:%M")
                  @restts.push([@time_slots[j].strftime("%H:%M"),1])
                end
              end

            end

          end
        end
      end
      @dining_info=@restaurant.dining_information

      @monday=@restaurant.time_periods.where(week_day: '1')
      @tuesday=@restaurant.time_periods.where(week_day: '2')
      @wednesday=@restaurant.time_periods.where(week_day: '3')
      @thursday=@restaurant.time_periods.where(week_day: '4')
      @friday=@restaurant.time_periods.where(week_day: '5')
      @saturday=@restaurant.time_periods.where(week_day: '6')
      @sunday=@restaurant.time_periods.where(week_day: '0')

    else

      if (@key.blank?)
      else
        @restaurants=Restaurant.joins("RIGHT OUTER JOIN dining_informations ON restaurants.id = dining_informations.restaurant_id").where("restaurant_name LIKE ? OR city LIKE ? OR province LIKE ?","%#{@key}%","%#{@key}%","%#{@key}%")
        @tss=[]
        if !@restaurants.empty?
          @restaurants.each do |r|
             puts r.restaurant_name
             @restts=[[],[]]
            # puts r.restaurant_name
             @time_slots = Array.new(48)
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
                  puts @p
                end
                set=false
                final=0
                for i in 0..46
                  if @time_slots[i+1]!=nil && @time_slots[i].strftime("%H:%M")<= @time &&@time_slots[i+1].strftime("%H:%M")>@time

                    @point=i
                    set=true

                    puts @time_slots[i]
                  end
                  if @time_slots[i]!=nil
                    final=i
                  end
                end
                if !set
                  @point=final
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

  end

  def add
    @mts=[]
    @id=params[:id]
    @restaurant=Restaurant.find(@id)
    @time_slot=params[:ts]
    @date=params[:date]
    @packs=params[:packs]
    meal_types=@restaurant.meal_types
    if !meal_types.nil?
      puts "here1"
      meal_types.each do |m|

        @start=m.start_time.strftime("%H:%M")
        @end=m.end_time.strftime("%H:%M")
        puts @start
        puts @end
        if (@start..@end).cover? @time_slot
          @mts<<m
        end

      end
    end
  end

  def add_to_waiting_list


    if request.post?
      @tss=TimeSlot.where("date=? and time=? and restaurant_id=?","#{params[:date]}","#{params[:time].to_time.strftime("%H:%M:%S")}","#{params[:restaurant_id]}" )
      @ts=@tss.first
      @entry=Waiting.new
      @entry.time_slot_id=@ts.id
      #change to session
      @entry.diner_id=session[:diner_id]
      @entry.save!
      flash[:success]="You have been added to the waiting list"
      redirect_to '/diner/home'
    else
      @id=params[:id]
      @restaurant=Restaurant.find(@id)
      @time_slot=params[:ts]
      @date=params[:date]
      @packs=params[:packs]
    end
  end
  def autocomplete_restaurant_name
    restaurants=Restaurant.joins("RIGHT OUTER JOIN dining_informations ON restaurants.id = dining_informations.restaurant_id").where("restaurant_name LIKE ? OR city LIKE ? OR province LIKE ?","%#{@key}%","%#{@key}%","%#{@key}%")

    render :json => restaurants.map { |rest| {:id => rest.id, :label => rest.restaurant_name, :value => rest.restaurant_name} }
  end

  def index

    if params[:term]
      @restaurants=Restaurant.joins("RIGHT OUTER JOIN dining_informations ON restaurants.id = dining_informations.restaurant_id").where("restaurant_name LIKE ? OR city LIKE ? OR province LIKE ?","%#{params[:term]}%","%#{params[:term]}%","%#{params[:term]}%")


    else
      @restaurants=Restaurant.all
    end

    respond_to do |format|
      puts "here"
      format.html # index.html.erb
# Here is where you can specify how to handle the request for "/people.json"
      puts @restaurants.to_json
      format.json { render :json => @restaurants.to_json }
    end
  end

end
