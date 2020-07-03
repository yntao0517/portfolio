class Hospital < ApplicationRecord
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
  validates :password, presence: true, length: { minimum: 6 }

  def Hospital.digest(string)
    cost ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
                            BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
