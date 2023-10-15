json.extract! post, :id, :title, :post_date, :author, :post_content, :category, :meta_desription, :meta_keywords, :meta_tags, :created_at, :updated_at
json.url post_url(post, format: :json)
