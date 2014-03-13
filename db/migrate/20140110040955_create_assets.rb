class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.references :attached, polymorphic: true
      t.attachment :attachment

      t.timestamps
    end
    add_index :assets, :attached_id
  end
end
