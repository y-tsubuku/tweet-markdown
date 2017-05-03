class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :markdown
      t.string :html
      t.string :image

      t.timestamps
    end
  end
end
