Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'posts#new'
  resources :posts, only: [:new, :create]
  post 'parse', to: 'root#parse'
end
