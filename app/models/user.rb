class User < ApplicationRecord
  has_secure_password
  has_many :articles, dependent: :destroy
  
  validates :username, uniqueness: true, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, format: { with: /\A[\d\-\s\(\)\+\.]+\z/, message: "must be a valid phone number" }, on: :create
  validates :address, presence: true, on: :create
  validates :city, presence: true, on: :create
  validates :state, presence: true, on: :create
  validates :zip_code, presence: true, format: { with: /\A\d{5}(-\d{4})?\z/, message: "must be a valid ZIP code" }, on: :create
  validates :level, presence: true, inclusion: { in: %w[Unknown Beginner Rookie Amateur Expert Pro ProMaster] }, on: :create
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :password_confirmation, presence: true, if: -> { password.present? }
  
  # Set defaults
  after_initialize :set_defaults, if: :new_record?
  
  # Normalize email to lowercase before saving
  before_save :normalize_email
  
  # Scopes
  scope :directors, -> { where(director: true) }
  scope :admins, -> { where(admin: true) }
  
  SKILL_LEVELS = %w[Unknown Beginner Rookie Amateur Expert Pro Pro Master].freeze
  
  def full_address
    return nil if address.blank? || city.blank? || state.blank? || zip_code.blank?
    "#{address}, #{city}, #{state} #{zip_code}"
  end
  
  def display_phone
    return nil if phone.blank?
    # Format phone number if it's 10 digits
    clean_phone = phone.gsub(/\D/, '')
    if clean_phone.length == 10
      "(#{clean_phone[0..2]}) #{clean_phone[3..5]}-#{clean_phone[6..9]}"
    else
      phone
    end
  end
  
  def fullname
    return nil if firstname.blank? || lastname.blank?
    "#{firstname} #{lastname}".strip
  end
  
  private
  
  def set_defaults
    self.admin ||= false
    self.director ||= false
    self.world_cup_selection_committee ||= false
    self.level ||= 'Unknown'
  end
  
  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end
