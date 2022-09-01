class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.order(created_at: :desc)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
    @params = params
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      flash['notice'] = 'Food has been added successfully!'
      redirect_to user_foods_path
    else
      flash['alert'] = 'There was an error in adding food item'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = 'Food deleted successfully'
    redirect_to user_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
