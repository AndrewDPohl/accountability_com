class AddFullStateNameToSenators < ActiveRecord::Migration
  def change
    add_column :senators, :full_state_name, :string
  end
end
