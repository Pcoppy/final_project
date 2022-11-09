class Producer < ApplicationRecord
  belongs_to :user
  # has_many :views, dependent: :destroy
end
