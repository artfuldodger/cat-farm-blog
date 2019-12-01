Rails.application.routes.draw do
  resources :posts
  devise_for :authors
  root to: 'posts#index'
end
