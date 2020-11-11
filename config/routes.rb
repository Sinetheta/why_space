Rails.application.routes.draw do
  get 'welcome/home'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :member, only: [:show]

  root 'welcome#home'
end
