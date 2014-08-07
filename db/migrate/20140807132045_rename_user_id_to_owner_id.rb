class RenameUserIdToOwnerId < ActiveRecord::Migration
  def up
    rename_column :itineraries, :user_id, :owner_id
  end

  def down
    rename_column :itineraries, :owner_id, :user_id
  end
end
