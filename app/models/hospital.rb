class Hospital < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :address, presence: true, length: { maximum: 150 }
  validates :phone_number, presence: true, numericality: :only_integer
  validates :representative, presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def Hospital.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Hospital.new_token
    SecureRandom.urlsafe_base64
  end

  def hospital_remember
    self.remember_token = Hospital.new_token
    update_attribute(:remember_digest, Hospital.digest(remember_token))
  end

  def hospital_authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_token).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
