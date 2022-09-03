require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'Jeremiah', email: 'jeremaih@gmail.com', password: 'password11',
                        password_confirmation: 'password11')
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      recipe = Recipe.create(name: 'Tobwa', description: 'Zambian Made', preparation_time: 30, cooking_time: 30,
                             user_id: @user.id)
      expect(recipe).to be_valid
    end
    it 'Invalid without a name' do
      recipe = Recipe.create(name: nil, description: 'Zambian Made', preparation_time: 30, cooking_time: 30,
                             user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'Invalid without description' do
      recipe = Recipe.create(name: 'Tobwa', description: nil, preparation_time: 30, cooking_time: 30, user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'Invalid without preparation time' do
      recipe = Recipe.create(name: 'Tobwa', description: 'Zambian Made', preparation_time: nil, cooking_time: 30,
                             user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'Invalid without cooking time' do
      recipe = Recipe.create(name: 'Tobwa', description: 'Zambian Made', preparation_time: 30, cooking_time: nil,
                             user_id: @user.id)
      expect(recipe).to_not be_valid
    end
    it 'Invalid without user id' do
      recipe = Recipe.create(name: 'Tobwaa', description: 'Itelian', preparation_time: 30, cooking_time: 30,
                             user_id: nil)
      expect(recipe).to_not be_valid
    end
  end
  context 'associations' do
    it 'has many recipe_foods' do
      assc = described_class.reflect_on_association(:recipe_foods)
      expect(assc.macro).to eq :has_many
    end
    it 'has many foods' do
      assc = described_class.reflect_on_association(:foods)
      expect(assc.macro).to eq :has_many
    end
    it 'belong_to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
