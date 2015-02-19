json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :image, :description
  json.url ingredient_url(ingredient, format: :json)
end
