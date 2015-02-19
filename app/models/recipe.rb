class Recipe < ActiveRecord::Base
  belongs_to :restaurant
  has_many :users, through: :saved_recipes
  has_many :saved_recipes
  has_many :ingredients, through: :quantities
  has_many :quantities

  # validate :at_least_one_ingredient

  # def at_least_one_ingredient
  #   errors.add(:base, 'needs at least one ingredient') unless self.ingredients.size > 0
  # end
end