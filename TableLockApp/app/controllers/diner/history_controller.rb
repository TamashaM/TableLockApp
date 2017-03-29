class Diner::HistoryController < ApplicationController
  def view

    @diner=Diner.find(1)

    @history=@diner.diner_history
  end
end
