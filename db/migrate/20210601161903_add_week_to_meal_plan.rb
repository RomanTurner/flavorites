class AddWeekToMealPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_plans, :unassigned, :string
    add_column :meal_plans, :monday, :string
    add_column :meal_plans, :tuesday, :string
    add_column :meal_plans, :wednesday, :string
    add_column :meal_plans, :thursday, :string
    add_column :meal_plans, :friday, :string
    add_column :meal_plans, :saturday, :string
    add_column :meal_plans, :sunday, :string
  end
end
