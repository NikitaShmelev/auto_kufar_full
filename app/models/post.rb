class Post < ApplicationRecord
    # belongs_to :user
    belongs_to :category
    
    mount_uploader :image, ImageUploader
    validates :title, :body, presence: true
    # has_many_attached :images 
    validates :price, presence: true

    validates :category, presence: false
end
