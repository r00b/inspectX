class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :mechanic_id
      t.integer :user_id
      t.string :location
      t.integer :vehicle_year
      t.string :vehicle_make
      t.string :vehicle_model
      t.date :date
      t.time :time
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
