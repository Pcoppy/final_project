class AddWishlistToProducer < ActiveRecord::Migration[7.0]
  def change
    add_column :producers, :wishlist, :text, array: true, default: []
  end
end
