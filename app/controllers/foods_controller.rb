class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.order(created_at: :desc).limit(5)
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
      redirect_to request.path
    end
    
    private 
    
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price)
    end
end

