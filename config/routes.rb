Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  root 'posts#index'

  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(index new create show destroy edit update) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
    resources :pages, only: %i(create destroy show edit update)
  end
end
