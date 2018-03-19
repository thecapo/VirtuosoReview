class Comment < ApplicationRecord
  validates_presence_of :comment_rating, :body
  belongs_to :user
  belongs_to :art
end
