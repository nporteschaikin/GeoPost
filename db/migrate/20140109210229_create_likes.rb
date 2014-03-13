class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :liked, polymorphic: true
      t.references :user
      t.datetime :created_at
    end
    add_index :likes, :liked_id
    add_index :likes, :user_id
  end
end
