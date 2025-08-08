class Article < ApplicationRecord
  has_rich_text :content
  
  validates :title, presence: true
  validates :author, presence: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :generate_slug, if: :title_changed?
  
  scope :published, -> { where('published_at <= ?', Time.current) }
  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order(published_at: :desc) }
  
  def to_param
    slug
  end
  
  private
  
  def generate_slug
    self.slug = title.parameterize if title.present?
  end
end
