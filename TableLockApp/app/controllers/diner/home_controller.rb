class Diner::HomeController < ApplicationController
  before_action :require_diner
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
      @array<<{r:r.restaurant_name,c:r.city}
    end
    respond_to do |format|
      puts "here"
      format.html # index.html.erb
# Here is where you can specify how to handle the request for "/people.json"
      puts @restaurants.map { |rest| {:id => rest.id, :label =>  rest.restaurant_name+" "+ rest.city, :value => rest.restaurant_name+" "+ rest.city }}
      # format.json { render :json =>@array.to_json
      # }
      format.json{render :json => @restaurants.map { |rest| {:id => rest.id, :label =>  rest.restaurant_name+" "+ rest.city, :value => rest.restaurant_name+" "+ rest.city, :category=>"restaurant"} }
      }
    end

  end
end
