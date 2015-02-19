Rails.application.routes.draw do
  
  # root 'restaurants#index'
  root to: "home#index"

  resources :quantities
  resources :ingredients
  resources :saved_recipes
  resources :recipes, only: [:index]
  
  resources :restaurants do
    resources :recipes
    collection do
      get :near
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"}

  resources :users, only: [:index, :show]

end
