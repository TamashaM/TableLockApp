class Diner::HistoryController < ApplicationController
  before_action :require_diner
  def view
    #should be replaced by session id
    @diner=Diner.find(session[:diner_id])

    @history=@diner.diner_history
    if !@history
      @history=DinerHistory.new
      @history.diner_id=@diner.id
      @history.delay_count=0
      @history.no_show_count=0
      @history.on_time_count=0
      @history.save!
    end

  end
end
