StoreApp::Application.routes.draw do
  root to: 'products#home'

  resources :products

end
