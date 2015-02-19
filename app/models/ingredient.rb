class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :quantities
  has_many :quantities
  mount_uploader :ingredient_image, IngredientImageUploader


end
