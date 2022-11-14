class AddTagsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :tags, :text, array: true, default: []
  end
end
