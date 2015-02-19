class RemoveImageFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :image
  end
end
