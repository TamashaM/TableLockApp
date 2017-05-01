class Diner::FavouritesController < ApplicationController
  before_action :require_diner
  def view

    @id=session[:diner_id]
    @favourites=Favourite.where("diner_id = ?", "#{@id}")

  end

end
