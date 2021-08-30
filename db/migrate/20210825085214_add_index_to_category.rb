class AddIndexToCategory < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :user_id
  end
end
