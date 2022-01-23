class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :role_id
      t.string :login
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :avatar

      t.timestamps
    end
  end
end
