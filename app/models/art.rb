class Art < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
end
