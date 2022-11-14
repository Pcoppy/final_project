class Producer < ApplicationRecord
  belongs_to :user
  has_one :wishlist, dependent: :destroy
  has_many :views
end
