class ChangeDefaultValueSubscriptionToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :subscription, "premium"
  end
end
