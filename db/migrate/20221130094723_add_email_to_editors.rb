class AddEmailToEditors < ActiveRecord::Migration[7.0]
  def change
    add_column :editors, :email, :string
  end
end
