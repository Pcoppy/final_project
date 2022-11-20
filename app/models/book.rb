class Book < ApplicationRecord
  CATEGORY = ["Adventure", "Action", "Thriller", "Romance", "Biography"]
  TAGS = ["Adventure", "Action", "Thriller", "Romance", "Biography"]

  belongs_to :author
  belongs_to :editor
  has_many :views
  validates :title, :publishing_year, :summary, presence: true
  validates :genre, inclusion: { in: CATEGORY }
  validates :tags, inclusion: { in: TAGS }
  def add_to_views_count(view_text)
    views_count.push(view_text)
    save
  end
end
