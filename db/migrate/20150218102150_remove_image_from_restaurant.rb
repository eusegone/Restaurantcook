class RemoveImageFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :image
  end
end
