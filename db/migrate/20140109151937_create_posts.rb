class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :place
      t.references :user
      t.references :category
      t.text :message
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps
    end
    add_index :posts, :place_id
    add_index :posts, :user_id
  end
end
