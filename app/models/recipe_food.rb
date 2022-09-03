class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'Recipe', foreign_key: 'recipe_id', counter_cache: true
  belongs_to :food, class_name: 'Food', foreign_key: 'food_id'
end
