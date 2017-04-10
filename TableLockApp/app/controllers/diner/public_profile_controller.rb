class Diner::PublicProfileController < ApplicationController
  def view
    @diner=Diner.find(1)
    @user=@diner.user
    @history=@diner.diner_history
  end
end
