class RemoveCountriesFromEditors < ActiveRecord::Migration[7.0]
  def change
    remove_column :editors, :country
  end
end
