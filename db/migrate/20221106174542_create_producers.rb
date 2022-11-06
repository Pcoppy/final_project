class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :company
      t.string :interests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
