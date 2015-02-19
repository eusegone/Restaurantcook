class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
