class RemoveImageUrlFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :image_url, :string
  end
end
