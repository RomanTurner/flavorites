class MealPlanRecipesController < ApplicationController
     before_action :find_meal_plan_recipe, only: [:destroy, :show]

    def index
        @meal_plan_recipes = MealPlanRecipe.all
        render json: @meal_plan_recipes
    end

     def create 
        @meal_plan_recipe = MealPlanRecipe.new(meal_plan_id:params[:meal_plan_id], recipe_id:params[:recipe_id]) 
        if @meal_plan_recipe.save 
        @meal_plan = MealPlan.find(@meal_plan_recipe.meal_plan_id)
        @meal_plan.update(unassigned:@meal_plan.unassigned << @meal_plan_recipe.id)
        render json: @meal_plan, each_serializer: MealPlanSerializer, root: false
     else
         render json: {message: "You fucked up.", errors: @meal_plan_recipes.errors}, status: :not_acceptable
     end
    end

      def destroy
        if @meal_plan_recipe.destroy
            render json: {message: "meal_plan_recipes successfully deleted."}, status: :ok
        else 
            render json: {message: "You fucked up.", errors: @meal_plan_recipes.errors}, status: :not_acceptable
        end
    end

    private 
    
        def find_meal_plan_recipe
            @meal_plan_recipe = MealPlanRecipe.find_by(meal_plan_id:params[:meal_plan_id], recipe_id:params[:recipe_id])
        end

end
