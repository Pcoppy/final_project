class Editor < ApplicationRecord
  belongs_to :user
  has_many :books
  validates :name, :country, presence: true
end
