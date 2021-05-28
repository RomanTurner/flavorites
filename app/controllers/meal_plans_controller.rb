class MealPlansController < ApplicationController
  before_action :find_meal_plan, only: [:update, :destroy]

    def index
        @meal_plans = MealPlan.all
        render json:  @meal_plans, status: :accepted
    end

    def show
        @meal_plan = MealPlan.find_by(id: params[:id])
        render json: @meal_plan, status: :accepted
    end
    
    def create 
        @meal_plan = MealPlan.new(meal_plan_params) 
        @meal_plan.user = @@user
        if @meal_plan.save
            render json: @meal_plan, status: :ok
        else
            render json: {message: "You fucked up.", errors: @meal_plan.errors}, status: :not_acceptable
        end
    end

    def update
        if @meal_plan.update(meal_plan_params)
            render json: @meal_plan, status: :ok
        else
            render json: {message: "You fucked up.", errors: @meal_plan.errors}, status: :not_acceptable
        end
    end

    def destroy
        if @meal_plan.destroy
            render json: {message: "meal_plan successfully deleted."}, status: :ok
        else 
            render json: {message: "You fucked up.", errors: @meal_plan.errors}, status: :not_acceptable
        end
    end

    private
    
    def find_meal_plan
        @meal_plan = MealPlan.find_by(id: params[:id])
    end

    def meal_plan_params
        params.require(:meal_plan).permit(:title)
    end
    
end
