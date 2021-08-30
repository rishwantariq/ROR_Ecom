class AddForeignKey < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, index: true
    add_foreign_key :products, :categories
  end
end
