class Diner::HomeController < ApplicationController
  def index


    end
  def home
    if params[:term]
      @restaurants=Restaurant.joins("RIGHT OUTER JOIN dining_informations ON restaurants.id = dining_informations.restaurant_id").where("restaurant_name LIKE ? OR city LIKE ? OR province LIKE ?","%#{params[:term]}%","%#{params[:term]}%","%#{params[:term]}%")


    else
      @restaurants=Restaurant.all
    end
    @diner=Diner.find_by_user_id(session[:user_id])
    @array=[]
    @restaurants.each do |r|
      @array<<r.restaurant_name
    end
    respond_to do |format|
      puts "here"
      format.html # index.html.erb
# Here is where you can specify how to handle the request for "/people.json"
      puts @restaurants.to_json
      format.json { render :json => @restaurants.to_json}
    end

  end
end
