class AddMechanicProfileColumnsToMechanic < ActiveRecord::Migration
  def change
  	add_column :mechanics, :type, :string
		add_column :mechanics, :company, :string
		add_column :mechanics, :address, :string
		add_column :mechanics, :city, :string
		add_column :mechanics, :state, :string
		add_column :mechanics, :zip, :string
		add_column :mechanics, :price, :string
  end
end
