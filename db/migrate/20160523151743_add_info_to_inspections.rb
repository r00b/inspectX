class AddInfoToInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :your_name, :string
    add_column :inspections,:your_address, :string
    add_column :inspections,:your_phone, :string
    add_column :inspections,:your_email, :string
    add_column :inspections,:seller_name, :string
    add_column :inspections,:seller_address, :string
    add_column :inspections,:seller_phone, :string
    add_column :inspections,:seller_email, :string
  end
end
