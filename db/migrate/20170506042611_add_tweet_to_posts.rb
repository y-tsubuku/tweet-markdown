class AddTweetToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :tweet, :string
  end
end
