class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.references :restaurant, index: true
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
