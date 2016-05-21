class DropMechanicProfilesTable < ActiveRecord::Migration
  def change
  	drop_table :mechanic_profiles
  end
end
