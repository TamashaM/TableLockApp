class DinerController < ApplicationController
  def index
  end
  def home
    @diner=Diner.find_by_user_id(params[:id])

  end
end
