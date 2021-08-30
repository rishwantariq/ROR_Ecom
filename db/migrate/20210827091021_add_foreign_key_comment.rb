class AddForeignKeyComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user
    add_foreign_key :comments, :users

    add_reference :comments, :product
    add_foreign_key :comments, :products

  end
end
