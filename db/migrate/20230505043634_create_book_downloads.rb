class CreateBookDownloads < ActiveRecord::Migration[7.0]
  def change
    create_table :book_downloads do |t|

      t.timestamps
    end
    
    add_column :book_downloads, :name, :string
    add_column :book_downloads, :phone, :string
    add_column :book_downloads, :email, :string
  end
end
