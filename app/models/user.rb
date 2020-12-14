class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { minimum: 8, maximum: 16 }, format: { with: /\A[a-z0-9]+\z/i }
end