class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      # t.integer :ads_id
      # t.integer :user_id
      t.text :text, null: false

      t.timestamps
    end
    add_reference :comments, :advert
    add_reference :comments, :user
  end
end
