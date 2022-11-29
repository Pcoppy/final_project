class AddPhoneNumberToEditors < ActiveRecord::Migration[7.0]
  def change
    add_column :editors, :phone_number, :string
  end
end
