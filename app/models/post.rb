class Post < ApplicationRecord
    validates :content, length: { maximum: 100 }


    belongs_to :user
    has_many :comments
    has_one_attached :image

    default_scope { order(created_at: :desc)}
end
