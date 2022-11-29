class AddMoreInfoToEditors < ActiveRecord::Migration[7.0]
  def change
    add_column :editors, :more_info, :text
  end
end
