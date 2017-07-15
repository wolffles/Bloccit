class AddTopicToSponseredPosts < ActiveRecord::Migration
  def change
    add_column :sponsered_posts, :topic_id, :integer
    add_index :sponsered_posts, :topic_id
  end
end
