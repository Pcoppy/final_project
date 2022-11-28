class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_antyhing,
  against: [ :title, :genre, :tags],
  associated_against: {
    author: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  CATEGORY = ["Adventure", "Action", "Thriller", "Romance", "Biography"]
  TAGS = %w[Fiction Non-Fiction Slow-Burn Medieval Gore Teenagers Religious Scholar Educational Tension Historic Sci-Fi Corporate War Jungle Forest Magic Animals Dragons Adults]

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
