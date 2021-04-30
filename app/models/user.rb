class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :posts
  has_many :comments, foreign_key: :author_id, class_name: "Comment"
  has_many :commented_posts, through: :comments, source: :author
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
