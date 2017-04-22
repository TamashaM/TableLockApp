class Diner::FavouritesController < ApplicationController
  def view

    @id=session[:diner_id]
    @favourites=Favourite.where("diner_id = ?", "#{@id}")

  end

end
