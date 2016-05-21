class AddUserReferenceToMechanics < ActiveRecord::Migration
  def change
  	add_reference :mechanics, :user, index: true, foreign_key: true
  end
end
