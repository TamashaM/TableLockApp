class Diner::FavouritesController < ApplicationController
  def view
    #change to session
    @id=1
    @favourites=Favourite.where("diner_id = ?", "#{@id}")

  end

end
