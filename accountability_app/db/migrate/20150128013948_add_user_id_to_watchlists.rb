class AddUserIdToWatchlists < ActiveRecord::Migration
  def change
    add_column :watchlists, :user_id, :integer
  end
end
