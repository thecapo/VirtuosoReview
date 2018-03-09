class AddArtToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :art_id, :integer
  end
end
