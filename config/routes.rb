Rails.application.routes.draw do
  devise_for :user
  root 'foods#index'
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :show, :create, :destroy]
    resources :recipes, only: [:index, :new, :show, :create, :destroy]
  end

  patch '/recipes/:id', to: 'recipes#toggle_public', as: :update_recipe

  resources :recipes, only: [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
