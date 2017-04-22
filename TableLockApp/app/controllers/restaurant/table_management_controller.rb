class Restaurant::TableManagementController < ApplicationController
  protect_from_forgery
  def edit
    @weekdays=WeekDay.all()
    @restaurant=Restaurant.find(session[:restaurant_id])
    @monday=@restaurant.time_periods.where(week_day: '1')
    @tuesday=@restaurant.time_periods.where(week_day: '2')
    @wednesday=@restaurant.time_periods.where(week_day: '3')
    @thursday=@restaurant.time_periods.where(week_day: '4')
    @friday=@restaurant.time_periods.where(week_day: '5')
    @saturday=@restaurant.time_periods.where(week_day: '6')
    @sunday=@restaurant.time_periods.where(week_day: '0')



  end
  def add
    @restaurant=Restaurant.find(session[:restaurant_id])


     params.inspect
     @days=params[:days]
     @valid=true
     @days.each do |d|
       @tps=@restaurant.time_periods.where(week_day: d.to_i)

       @t=TimePeriod.new
       @t.restaurant_id=session[:restaurant_id]
       @t.week_day=d.to_i
       @t.start_time=params[:tp][:start_time]
       @t.end_time=params[:tp][:end_time]
       @valid=true
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
       day=WeekDay.find(@t.week_day).day
       if @valid
         @t.save!

         flash[:notice1]="Time Period for "+ "#{ day}"+" added successfully"
       else
         flash[:notice2]="Time Period for "+ "#{day}"+ " could not be added"
       end

     end



      redirect_to '/restaurant/table_management/edit'


  end

end
