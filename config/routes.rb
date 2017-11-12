Rails.application.routes.draw do
  devise_for :users

  resources :products do
  resources :comments
end
  resources :users
  get 'static_pages/landing_page'

  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'static_pages/about' 

  get 'static_pages/contact'

  post 'static_pages/thank_you'

  root 'static_pages#landing_page'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
