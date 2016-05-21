class RemoveMechanicIdFromMechanic < ActiveRecord::Migration
  def change
  	remove_column :mechanics, :mechanic_id, :integer
  end
end
