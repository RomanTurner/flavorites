class RecipesController < ApplicationController
    # skip_before_action :authorized
    before_action :find_recipe, only: [:destroy, :show]

    def index
    recipes = Recipe.limit(params[:limit]).offset(params[:offset])
    render json: {recipes: recipes}
    end 

    def show 
    render json: @recipe
    end 

    def search  
        recipes = Recipe.where('title like ?', "%#{params[:search]}%")
        binding.pry
     render json: {recipes: recipes}
    end 

private 
    
    def find_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end
end
