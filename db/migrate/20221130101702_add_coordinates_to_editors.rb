class AddCoordinatesToEditors < ActiveRecord::Migration[7.0]
  def change
    add_column :editors, :latitude, :float
    add_column :editors, :longitude, :float
  end
end
