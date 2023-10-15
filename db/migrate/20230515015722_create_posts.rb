class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :post_date
      t.string :author
      t.text :post_content
      t.string :category
      t.string :meta_desription
      t.string :meta_keywords
      t.string :meta_tags

      t.timestamps
    end
  end
end
