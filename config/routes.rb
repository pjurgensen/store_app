StoreApp::Application.routes.draw do
  root to: 'products#home'

  resources :users, :except => [:index, :update, :edit]
  resources :products

end
