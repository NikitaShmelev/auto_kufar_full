class Post < ApplicationRecord
    # belongs_to :user
    mount_uploader :image, ImageUploader
    validates :title, :body, presence: true
    # has_many_attached :images 

end
