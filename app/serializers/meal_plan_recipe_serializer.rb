class MealPlanRecipeSerializer < ActiveModel::Serializer
  attributes :id, :recipe, :meal_plan

  def meal_plan 
    object.meal_plan.id,
    object.meal_plan.unassigned,
    object.meal_plan.monday,
    object.meal_plan.tuesday,
    object.meal_plan.wednesday,
    object.meal_plan.thursday,
    object.meal_plan.friday,
    object.meal_plan.saturday,
    object.meal_plan.sunday,
  end
  
  def meal_plan_recipes
    object.meal_plan_recipes.map do |mpr|
      {
       mprid: mpr.id, 
       main_img: mpr.recipe.main_img, 
       id: mpr.recipe.id
      }
    end
  end

end

