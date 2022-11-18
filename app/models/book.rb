class Book < ApplicationRecord
  CATEGORY = ["adventure", "action", "thriller", "romance", "biography"]
  TAGS = ["adventure", "action", "thriller", "romance", "biography"]

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
