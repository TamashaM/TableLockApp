class Restaurant::TableManagementController < ApplicationController
  protect_from_forgery
  def edit
    @weekdays=WeekDay.all()
    @restaurant=Restaurant.find(3)
    @monday=@restaurant.time_periods.where(week_day: '1')
    @tuesday=@restaurant.time_periods.where(week_day: '2')
    @wednesday=@restaurant.time_periods.where(week_day: '3')
    @thursday=@restaurant.time_periods.where(week_day: '4')
    @friday=@restaurant.time_periods.where(week_day: '5')
    @saturday=@restaurant.time_periods.where(week_day: '6')
    @sunday=@restaurant.time_periods.where(week_day: '7')



  end
  def add
    @restaurant=Restaurant.find(3)


     params.inspect
     @days=params[:days]
     @valid=true
     @days.each do |d|
       @tps=@restaurant.time_periods.where(week_day: d.to_i)

       @t=TimePeriod.new
       @t.restaurant_id=3
       @t.week_day=d.to_i
       @t.start_time=params[:tp][:start_time]
       @t.end_time=params[:tp][:end_time]
       if @t.start_time< @t.end_time
         @tps.each do |tp|
           if @t.start_time>=tp.start_time && @t.start_time<tp.end_time || @t.end_time>tp.start_time && @t.end_time<=tp.end_time
             @valid=false
             puts "found error"

           end
         end

       else


         puts "coudnt add"

         @valid=false
       end

     end


    if @valid
      @t.save!
      flash[:notice]="Time Period added successfully"
      redirect_to '/restaurant/table_management/edit'
    else
      redirect_to '/restaurant/table_management/edit'
    end
  end

end
