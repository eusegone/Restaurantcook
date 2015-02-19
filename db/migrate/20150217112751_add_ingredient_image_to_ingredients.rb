class AddIngredientImageToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ingredient_image, :string
  end
end
