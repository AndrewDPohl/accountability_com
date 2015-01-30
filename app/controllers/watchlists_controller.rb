class WatchlistsController < ApplicationController
  def index
    @watchlist = current_user.watchlist
  end   

  def add
    senator = Senator.find_by({id: params[:senator_id]})
    watchlist = current_user.watchlist || current_user.create_watchlist
    watchlist.senators.push senator
    redirect_to "/watchlist"
  end

  def remove

  end
end
