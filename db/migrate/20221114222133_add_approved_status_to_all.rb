class AddApprovedStatusToAll < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :approved, :boolean, default: false
    add_column :authors, :approved, :boolean, default: false
  end
end
