class User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :fullname, presence: true
  
  # Set admin to false by default
  after_initialize :set_default_admin, if: :new_record?
  
  private
  
  def set_default_admin
    self.admin ||= false
  end
end
