class User < ApplicationRecord
  has_many :comments
  has_many :articles
  before_save {self.email = email.downcase}

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3 , maximum: 50}
  VALIDATE_EMAIL = /\A[^\s@]+@[^\s@]+\.[^\s@]+\z/i
  validates :email, presence:true, length: {maximum: 100}, format: {with: VALIDATE_EMAIL}

  has_secure_password
end
