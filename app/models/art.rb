class Art < ApplicationRecord
  searchkick word_start: [:title]
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
end
