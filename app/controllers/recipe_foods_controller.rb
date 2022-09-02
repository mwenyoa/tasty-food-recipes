class RecipeFoodsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe_food = Recipe.find(params[:recipe_id])
  end
end
