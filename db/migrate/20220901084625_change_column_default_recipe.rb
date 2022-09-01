class ChangeColumnDefaultRecipe < ActiveRecord::Migration[7.0]
  def change
    change_column_default :recipes, :public, default: true
  end
end
