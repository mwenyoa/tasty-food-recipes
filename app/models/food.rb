class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, class_name: 'RecipeFood', foreign_key: 'recipe_id', dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, _uniqueness: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :recipe_foods
end
