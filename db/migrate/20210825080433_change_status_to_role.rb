class ChangeStatusToRole < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :status, :role

  end
end
