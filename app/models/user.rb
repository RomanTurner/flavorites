class User < ApplicationRecord
    has_secure_password 
    validates :username, uniqueness: true

    has_many :follows, dependent: :destroy

    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    has_many :meal_plans 
    has_many :recipes, through: :meal_plans
end
