class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
