class PageVisit < ApplicationRecord
  belongs_to :ip_visitor
  
  validates :page_path, presence: true
  validates :visited_at, presence: true
  
  scope :recent, -> { order(visited_at: :desc) }
  scope :by_page, ->(path) { where(page_path: path) }
end
