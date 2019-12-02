Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :authors
  root to: 'posts#index'
end
