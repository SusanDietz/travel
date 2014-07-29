class AddIteneraryId < ActiveRecord::Migration
  def change
    add_column :points, :itinerary_id, :integer
  end
end
