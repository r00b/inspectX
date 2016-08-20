class AddSecondSpecialityToMechanic < ActiveRecord::Migration
  def change
    add_column :mechanics, :second_speciality, :string
  end
end
