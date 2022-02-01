class CreateUsers < ActiveRecord::Migration[7.0]
  # def up
  #   add_index :users, :login, unique: true
  # end
  def change
    create_table :users do |t|
      # t.integer :role_id, default: 1
      # t.references :roles, default: 1, foreign_key: true
      t.string :login, null: false
      t.string :password
      t.string :first_name
      t.string :last_name
      # t.string :email, null: false
      t.string :phone
      t.string :avatar

      t.timestamps
    end
    add_reference :users, :role, default: 1
    # add_foreign_key :users, :roles
    add_index :users, :login, unique: true
    # add_index :users, :email, unique: true
  end
end
