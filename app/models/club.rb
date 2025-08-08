class Club < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :website, format: { with: URI::regexp }, allow_blank: true
  
  scope :recent, -> { order(created_at: :desc) }
  scope :by_state, ->(state) { where(state: state) }
  scope :by_city, ->(city) { where(city: city) }
  
  def full_address
    [address, city, state, zip_code].compact.join(', ')
  end
  
  def display_phone
    return "Not provided" if phone.blank?
    phone
  end
  
  def display_email
    return "Not provided" if email.blank?
    email
  end
  
  def display_website
    return "No website" if website.blank?
    website
  end
  
  def google_maps_url
    return nil if coordinates.blank?
    "https://www.google.com/maps?q=#{coordinates}"
  end
  
  def established_year
    established_date&.year
  end
end
