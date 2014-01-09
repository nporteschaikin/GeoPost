class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :remember_token
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
