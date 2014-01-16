class CreateFilterRules < ActiveRecord::Migration
  def change
    create_table :filter_rules do |t|
      t.references :filter
      t.string :scope
      t.text :value

      t.timestamps
    end
    add_index :filter_rules, :filter_id
  end
end
