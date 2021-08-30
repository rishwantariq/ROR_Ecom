class AddForeignKeyProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :user
    add_foreign_key :products, :users
  end
end
