class Comment < ApplicationRecord
    validates :content, length: { maximum: 100 }


    belongs_to :post
    belongs_to :author, class_name: 'User'
end
