class AddArtToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :art, foreign_key: true
  end
end
