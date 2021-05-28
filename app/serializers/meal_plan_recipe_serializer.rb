class MealPlanRecipeSerializer < ActiveModel::Serializer
  attributes :id, :recipe, :meal_plan

  def meal_plan 
   object.meal_plan.id
  end

  def recipe
    {
      title: object.recipe['title'],
      img: object.recipe['main_img'],
      id: object.recipe['id'],
    }
  end

end