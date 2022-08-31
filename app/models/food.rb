class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', dependent: :destroy
  has_many :recipe_foods, class_name: 'recipe_food', foreign_key: 'recipe_id'

  validates :name, presence: true, _uniqueness: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
end
