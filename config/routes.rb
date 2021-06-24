Rails.application.routes.draw do
  devise_for :users
  get 'animals/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "animals#index"
  get 'animals/search'

  resources :animals do
    resources :tweets, only: [:index, :create, :show, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :new]
  end
  
  resources :tweets, only: [:index, :create, :show, :destroy] do
    resources :messages, only: [:new, :create]
  end


  resources :users, only: :index

  
end
