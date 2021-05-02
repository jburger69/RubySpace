class Comment < ApplicationRecord
    validates :content, length: { maximum: 250 }, presence: true


    belongs_to :post
    belongs_to :author, class_name: 'User', foreign_key: :author_id

    default_scope { order(created_at: :desc)}
end
