class CreateAdverts < ActiveRecord::Migration[7.0]
  def change
    create_table :adverts do |t|
      t.integer :user_id
      t.string :title
      t.string :image
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end
