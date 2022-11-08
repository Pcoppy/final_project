class Book < ApplicationRecord
  belongs_to :author
  belongs_to :editor
  has_many :views
end
