class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save { email.downcase! }

  validates :first_name, :last_name,
            length: { minimum: 2,
                      maximum: 50,
                      too_short: "Please add more than 1 character" }
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password_digest,
            length: { minimum: 6, maximum: 15 }

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
