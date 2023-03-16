class User < ApplicationRecord
  has_secure_password

  #relation
  has_many :images

  #validation
  validates :user_id, uniqueness: true, presence: true
  validates :password, presence: true
end
