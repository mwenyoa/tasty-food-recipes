class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, class_name: 'RecipeFood', dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, :description, :cooking_time, :preparation_time, presence: true
end
