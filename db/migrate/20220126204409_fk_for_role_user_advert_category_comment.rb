class FkForRoleUserAdvertCategoryComment < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :roles
    add_foreign_key :adverts, :categories
    add_foreign_key :adverts, :users
    add_foreign_key :comments, :adverts
    add_foreign_key :comments, :users
  end
end
