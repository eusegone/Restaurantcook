json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :restaurant_id, :image, :description
  json.url recipe_url(recipe, format: :json)
end
