class DeleteUserIdFromPoints < ActiveRecord::Migration
    def change
      remove_column :points, :user_id
    end
end
