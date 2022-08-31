Rails.application.routes.draw do
  devise_for :user
  root 'foods#index'
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :show, :create, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
