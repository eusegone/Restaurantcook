class Restaurant < ActiveRecord::Base
  has_many :recipes
  mount_uploader :restaurant_image, RestaurantImageUploader

  geocoded_by :postcode  
  after_validation :geocode, :if => :postcode_changed?

  # add_index :restaurants, :name, unique: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
