class AddTitleToMealPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_plans, :title, :string
  end
end
