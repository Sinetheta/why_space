Rails.application.routes.draw do
  get 'welcome/home'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :friendships, only: [:create]

  resources :members, only: [:show] do
    get 'my_profile', on: :collection
  end

  root 'welcome#home'
end
