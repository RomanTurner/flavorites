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
         recipes: plan.recipes.collect do |recipe|
          {
           id:recipe.id, 
           title:recipe.title
          }
        end
       }
    end 
  end

end
