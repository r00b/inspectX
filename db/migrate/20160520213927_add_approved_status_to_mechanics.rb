class AddApprovedStatusToMechanics < ActiveRecord::Migration
  def change
  	add_column :mechanics, :approved, :boolean, default: false
  end
end
