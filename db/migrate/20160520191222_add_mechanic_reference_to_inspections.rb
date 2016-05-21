class AddMechanicReferenceToInspections < ActiveRecord::Migration
  def change
  	add_reference :inspections, :mechanics, index: true, foreign_key: true
  end
end
