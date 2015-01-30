class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.json :latest_bills

      t.timestamps null: false
    end
  end
end
