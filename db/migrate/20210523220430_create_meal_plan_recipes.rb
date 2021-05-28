class CreateMealPlanRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_plan_recipes do |t|
      t.references :meal_plan
      t.references :recipe
      t.timestamps
    end
  end
end
