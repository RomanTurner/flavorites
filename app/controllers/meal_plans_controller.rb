class MealPlansController < ApplicationController
  before_action :find_meal_plan, only: [:update, :destroy, :show]

    def index
        @meal_plans = MealPlan.all
        render json:  @meal_plans, status: :accepted
    end

    def show
        render json: @meal_plan, status: :accepted
    end
    
    def create 
        @meal_plan = MealPlan.new(title: params[:title]) 
        @meal_plan.user = @@user
        if @meal_plan.save
            render json: @meal_plan, status: :ok
        else
            render json: {message: "You fucked up.", errors: @meal_plan.errors}, status: :not_acceptable
        end
    end

    def update
         if @meal_plan.update(
            unassigned: params[:Unassigned], 
            monday: params[:Monday],
            tuesday: params[:Tuesday],
            wednesday: params[:Wednesday],
            thursday: params[:Thursday],
            friday: params[:Friday],
            saturday: params[:Saturday],
            sunday: params[:Sunday],
         )
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
    
end


          