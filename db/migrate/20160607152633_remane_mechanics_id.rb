class RemaneMechanicsId < ActiveRecord::Migration
  def up
    rename_column :inspections, :mechanics_id, :mechanic_id
  end

  def down
    rename_column :inspections, :mechanic_id, :mechanics_id
  end
end
