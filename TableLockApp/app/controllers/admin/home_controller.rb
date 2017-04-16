class Admin::HomeController < ApplicationController
  protect_from_forgery
  def home

  end
  def search
    #change to session
    @admin_id=2

    if params[:search_by].to_i==1
      @restaurants=Restaurant.where("restaurant_name LIKE ?  ","%#{params[:restaurant_search]}%")

    elsif params[:search_by].to_i==2

      @diners=Diner.where("first_name LIKE ? or last_name LIKE ? ","%#{params[:diner_search]}%","%#{params[:diner_search]}%")
    end
    render "home"
  end

end
