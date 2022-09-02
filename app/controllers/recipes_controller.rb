class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
    @params = params
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash['notice'] = 'Recipe has been added successfully!'
      redirect_to user_recipes_path
    else
      flash['alert'] = 'There was an error in adding recipe item'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'Recipe deleted successfully'
    redirect_to user_recipes_path
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user, :foods,
                                      :recipe_foods).where(public: true).order(created_at: :desc).map do |recipe|
      {
        id: recipe.id,
        name: recipe.name,
        description: recipe.description,
        author: recipe.user.name,
        created_at: recipe.created_at,
        items: recipe.total_count,
        total_price: recipe.foods.map(&:price).sum
      }
    end
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
