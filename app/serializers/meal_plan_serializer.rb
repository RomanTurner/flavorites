class MealPlanSerializer < ActiveModel::Serializer
  attributes :id, :recipes, :title

  def recipes 
  object.recipes.map do |recipe|
    { 
      title: recipe['title'],
      img: recipe['main_img'],
      id: recipe['id'],
    }
  end 
 end 
end
