class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.integer :mechanic_id
      t.string :bio
      t.string :speciality

      t.timestamps null: false
    end
  end
end
