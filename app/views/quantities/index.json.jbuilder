json.array!(@quantities) do |quantity|
  json.extract! quantity, :id, :recipe_id, :ingredient_id, :quantity, :unit
  json.url quantity_url(quantity, format: :json)
end
