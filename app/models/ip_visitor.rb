class IpVisitor < ApplicationRecord
  has_many :page_visits, dependent: :destroy
  
  validates :ip_address, presence: true, uniqueness: true
  validates :visit_count, numericality: { greater_than_or_equal_to: 0 }
  
  scope :recent, -> { order(last_visit: :desc) }
  scope :most_visited, -> { order(visit_count: :desc) }
  
  def self.track_visit(ip_address, user_agent, page_path)
    visitor = find_or_create_by(ip_address: ip_address) do |v|
      v.user_agent = user_agent
      v.visit_count = 0
    end
    
    visitor.update!(
      last_visit: Time.current,
      visit_count: visitor.visit_count + 1
    )
    
    visitor.page_visits.create!(
      page_path: page_path,
      visited_at: Time.current
    )
    
    visitor
  end
end
