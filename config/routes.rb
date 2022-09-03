Rails.application.routes.draw do
  devise_for :user
  root 'recipes#public_recipes'
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :show, :create, :destroy]
    resources :recipes, only: [:index, :new, :show, :create, :destroy]
  end

  patch '/recipes/:id', to: 'recipes#toggle_public', as: :update_recipe
  get '/public_recipes', to: 'recipes#public_recipes', as: :public_recipes
  get '/shopping_list/:recipe_id', to: 'recipe_foods#shopping_list', as: :shopping_list

  resources :recipes, only: [:index, :show]

  resources :recipes do
    resources :recipe_foods, only: [:create, :new, :edit, :update, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
