class AddBioguideidToSenators < ActiveRecord::Migration
  def change
    add_column :senators, :bioguideid, :string
  end
end
