class Diner::HistoryController < ApplicationController
  def view
    #should be replaced by session id
    @diner=Diner.find(1)

    @history=@diner.diner_history

  end
end
