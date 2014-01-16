class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.references :user

      t.timestamps
    end
    add_index :filters, :user_id
  end
end
