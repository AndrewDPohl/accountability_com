class AddWatchlistIdToSenators < ActiveRecord::Migration
  def change
    add_column :senators, :watchlist_id, :integer
  end
end
