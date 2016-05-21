class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :mechanics, :type, :kind
  end
end
