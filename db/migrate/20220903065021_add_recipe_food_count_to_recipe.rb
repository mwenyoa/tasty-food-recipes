class AddRecipeFoodCountToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :recipe_foods_count, :integer
  end
end
