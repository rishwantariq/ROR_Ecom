class ChangeCateogoryColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :type, :type_category
  end
end
