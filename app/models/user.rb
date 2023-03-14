class User < ApplicationRecord
  has_secure_password

  #relation
  has_many :images

  #validation
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
