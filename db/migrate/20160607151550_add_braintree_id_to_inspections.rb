class AddBraintreeIdToInspections < ActiveRecord::Migration
  def up
    add_column :inspections, :braintree_id, :string
  end

  def down
    remove_column :inspections, :braintree_id
  end
end
