class RemoveMetaTagsFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :meta_tags, :string
  end
end
