class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :foods, class_name: "Food", foreign_key: 'user_id', dependent: :destroy
  has_many :recipes, class_name: "Recipe", foreign_key: 'user_id', dependent: :destroy

  # input validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
end
