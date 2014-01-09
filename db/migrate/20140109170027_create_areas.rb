class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.references :user
      t.references :place
      t.integer :radius
      t.string :label

      t.timestamps
    end
    add_index :areas, :user_id
    add_index :areas, :place_id
  end
end
