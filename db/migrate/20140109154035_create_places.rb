class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :query
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :types
    end
  end
end
