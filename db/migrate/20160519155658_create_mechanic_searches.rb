class CreateMechanicSearches < ActiveRecord::Migration
  def change
    create_table :mechanic_searches do |t|
      t.integer :user_id
      t.string :zip
      t.string :vehicle_make

      t.timestamps null: false
    end
  end
end
