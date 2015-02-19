class AddRestaurantImageToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :restaurant_image, :string
  end
end
