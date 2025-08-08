class User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :fullname, presence: true
  
  # Set defaults
  after_initialize :set_defaults, if: :new_record?
  
  # Scopes
  scope :directors, -> { where(director: true) }
  scope :admins, -> { where(admin: true) }
  
  private
  
  def set_defaults
    self.admin ||= false
    self.director ||= false
  end
end
