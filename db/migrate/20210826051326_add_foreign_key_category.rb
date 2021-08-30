class AddForeignKeyCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :user
    add_foreign_key :categories, :users

    add_reference :products, :user
    add_foreign_key :products, :users
  end
end
