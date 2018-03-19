class AddCommentRatingToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :comment_rating, :decimal
  end
end
