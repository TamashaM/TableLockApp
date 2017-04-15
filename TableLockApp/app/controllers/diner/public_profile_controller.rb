class Diner::PublicProfileController < ApplicationController
  def view
    @diner=Diner.find(params[:diner_id])
    @user=@diner.user
    @history=@diner.diner_history
  end
end
