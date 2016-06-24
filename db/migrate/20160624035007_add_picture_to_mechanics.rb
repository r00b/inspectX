class AddPictureToMechanics < ActiveRecord::Migration
  def up
    add_attachment :mechanics, :picture
  end

  def down
    remove_attachment :mechanics, :picture
  end
end
