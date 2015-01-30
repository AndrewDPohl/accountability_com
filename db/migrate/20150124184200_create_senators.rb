class CreateSenators < ActiveRecord::Migration
  def change
    create_table :senators do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :gender
      t.string :political_party
      t.string :job_title
      t.string :state
      t.string :rank
      t.string :phone
      t.date :start_date
      t.date :end_date
      t.string :website
      t.string :link_to_gov
      t.string :twitter_handle
      t.string :youtube_id
      t.string :cspan_id
      t.string :pvsid
      t.string :osid

      t.timestamps null: false
    end
  end
end
