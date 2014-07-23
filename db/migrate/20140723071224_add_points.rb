class AddPoints < ActiveRecord::Migration
  def up
      add_column :points, :latitude, :float #you can change the name, see wiki
      add_column :points, :longitude, :float #you can change the name, see wiki
      add_column :points, :gmaps, :boolean #not mandatory, see wiki
      add_column :points, :description, :text
      add_column :points, :name, :string
      remove_column :points, :lat
      remove_column :points, :lng
  end

  def down
      remove_column :points, :latitude
      remove_column :points, :longitude
      remove_column :points, :gmaps
      remove_column :points, :description
      remove_column :points, :name
      add_column :points, :lat, :float
      add_column :points, :lng, :float
  end
end
