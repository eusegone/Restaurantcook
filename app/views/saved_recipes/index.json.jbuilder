json.array!(@saved_recipes) do |saved_recipe|
  json.extract! saved_recipe, :id, :user_id, :recipe_id
  json.url saved_recipe_url(saved_recipe, format: :json)
end
