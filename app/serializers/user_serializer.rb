class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :bio, :followers, :following, :meal_plans
  
  def followers
    object.followers.map do |follower|
      { username: follower.username,} 
    end
  end 
  
  def following
    object.following.map do |follower|
       { username: follower.username,}  
    end 
  end

  def meal_plans
    object.meal_plans.map do |plan|
       { 
         title: plan.title,
         id: plan.id,
         unassigned: plan.unassigned,
         monday: plan.monday,
         tuesday: plan.tuesday,
         wednesday: plan.wednesday,
         thursday: plan.thursday,
         friday: plan.friday,
         saturday: plan.saturday,
         sunday: plan.sunday,
         created_at: plan.created_at,
         meal_plan_recipes: plan.meal_plan_recipes.map do |mpr|
       {
         mprid: mpr.id, 
         main_img: mpr.recipe.main_img, 
         id: mpr.recipe.id, 
         title: mpr.recipe.title,
       }
      end
      }
    end 
  end

end
