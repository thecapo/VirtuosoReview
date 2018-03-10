class AddImageToArts < ActiveRecord::Migration[5.1]
  def change
    add_column :arts, :image, :string
  end
end
