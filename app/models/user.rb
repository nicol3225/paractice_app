class User < ApplicationRecord

    mount_uploader :image, ImageUploader

    validates :email, presence: true
    validates :username, presence: true
    validates :password, presence: true
    validates :username, uniqueness: true
    validates :email, uniqueness: true

    has_many :posts
    
end
