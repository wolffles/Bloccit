class CreateSponseredPosts < ActiveRecord::Migration
  def change
    create_table :sponsered_posts do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps null: false
    end
  end
end
