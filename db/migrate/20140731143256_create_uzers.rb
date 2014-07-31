class CreateUzers < ActiveRecord::Migration
  def change
    create_table :uzers do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end
