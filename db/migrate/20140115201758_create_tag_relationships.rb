class CreateTagRelationships < ActiveRecord::Migration
  def change
    create_table :tag_relationships do |t|
      t.references :tagged, polymorphic: true
      t.references :tag
    end
    add_index :tag_relationships, :tag_id
  end
end
