class ChangeFirstNameAndLastNameFromAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :full_name, :string
  end
end
