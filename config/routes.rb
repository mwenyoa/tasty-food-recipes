Rails.application.routes.draw do
  get 'recipe_foods/create'
  get 'recipe_foods/new'
  get 'recipe_foods/edit'
  devise_for :user
  root 'recipes#public_recipes'
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :show, :create, :destroy]
    resources :recipes, only: [:index, :new, :show, :create, :destroy]
  end

  patch '/recipes/:id', to: 'recipes#toggle_public', as: :update_recipe
  get '/public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  resources :recipes, only: [:index, :show]

  resources :recipes do
    resources :recipe_foods, only: [:create, :new, :edit, :update, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
