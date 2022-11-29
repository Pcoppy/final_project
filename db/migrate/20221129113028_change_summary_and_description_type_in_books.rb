class ChangeSummaryAndDescriptionTypeInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :summary, :text
    change_column :books, :additionnal_description, :text
  end
end
