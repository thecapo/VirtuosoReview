class AddRatingToArts < ActiveRecord::Migration[5.1]
  def change
    add_column :arts, :rating, :decimal
  end
end
