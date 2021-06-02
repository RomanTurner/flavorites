class MealPlan < ApplicationRecord
    belongs_to :user
    has_many :meal_plan_recipes, dependent: :destroy
    has_many :recipes, through: :meal_plan_recipes
    serialize  :unassigned, Array
    serialize  :monday, Array
    serialize  :tuesday, Array
    serialize  :wednesday, Array
    serialize  :thursday, Array
    serialize  :friday, Array
    serialize  :saturday, Array
    serialize  :sunday, Array
end
