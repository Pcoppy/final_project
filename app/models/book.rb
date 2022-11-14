class Book < ApplicationRecord
  belongs_to :author
  belongs_to :editor
  has_many :views
  validates :title, :publishing_year, :summary, presence: true
  validates :genre, inclusion: { in: ["tbd"] }
end
