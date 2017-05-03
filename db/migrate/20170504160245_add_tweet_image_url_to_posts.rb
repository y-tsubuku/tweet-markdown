class AddTweetImageUrlToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :tweet_image_url, :string
  end
end
