class Post < ApplicationRecord
  
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  
  #validates :feature_image, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/webp'], size_range: 1..(2.megabytes) }
  
  has_one_attached :feature_image

  validates :title, presence: true
  validates :post_date, presence: true
  validates :author, presence: true
  validates :meta_desription, presence: true


end
