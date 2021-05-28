class Recipe < ApplicationRecord
    serialize  :ingriedients, Array
    serialize  :metadata, Hash
    serialize  :instructions, Array
    serialize  :keywords, Array
    serialize  :tips, Array
    serialize  :instruction_imgs, Array 

    validates :title, uniqueness: true
    has_many :meal_plan_recipes, dependent: :destroy
end
