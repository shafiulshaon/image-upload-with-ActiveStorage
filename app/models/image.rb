class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :image_file
end
