class Diner::HomeController < ApplicationController
  def index
  end
  def home

    @diner=Diner.find_by_user_id(session[:user_id])

  end
end
