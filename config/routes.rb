Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :newsletter_subscriptions, only: %i[create]
  devise_for :authors
  root to: 'posts#index'
end
