class CreateAdverts < ActiveRecord::Migration[7.0]
  def change
    create_table :adverts do |t|
      # t.integer :user_id
      t.string :title, null: false
      t.string :image
      t.string :description
      t.text :text, null: false
      # t.integer :category_id

      t.timestamps
    end
    add_reference :adverts, :category
    add_reference :adverts, :user
  end
end
