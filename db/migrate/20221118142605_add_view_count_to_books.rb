class AddViewCountToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :views_count, :text, array: true, default: []
  end
end
