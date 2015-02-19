class CreateSavedRecipes < ActiveRecord::Migration
  def change
    create_table :saved_recipes do |t|
      t.references :user, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
