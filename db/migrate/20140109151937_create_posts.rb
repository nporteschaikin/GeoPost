class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :place
      t.references :user
      t.text :message

      t.timestamps
    end
    add_index :posts, :place_id
    add_index :posts, :user_id
  end
end
