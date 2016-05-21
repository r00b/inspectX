class RemoveMechanicIdFromInspections < ActiveRecord::Migration
  def change
  	remove_column :inspections, :mechanic_id, :integer
  end
end
