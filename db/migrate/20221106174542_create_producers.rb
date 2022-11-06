class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :company
      t.string :interests

      t.timestamps
    end
  end
end
