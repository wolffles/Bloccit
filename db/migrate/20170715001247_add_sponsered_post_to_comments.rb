class AddSponseredPostToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sponsered_post_id, :integer
    add_index :comments, :sponsered_post_id
  end
end
