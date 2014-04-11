StoreApp::Application.routes.draw do
  root to: 'users#home'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, :except => [:index, :update, :edit]
  resources :sessions
  resources :products

end
