class CreateMechanicProfiles < ActiveRecord::Migration
  def change
    create_table :mechanic_profiles do |t|
      t.integer :user_id
      t.string :type
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :speciality
      t.string :price

      t.timestamps null: false
    end
  end
end
