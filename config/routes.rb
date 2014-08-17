Rails.application.routes.draw do
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: "sessions#new"

  resources :sessions,  only: [:create, :new, :destroy]
  resources :bicycles
  resources :users,     only: [:create, :new] do
    get :confirm, on: :collection
  end

end
