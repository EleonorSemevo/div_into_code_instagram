class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true
  validates :email, presence: true, length: {minimum: 4}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: true
  has_many :posts
  has_secure_password

end
