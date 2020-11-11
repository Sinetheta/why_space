Rails.application.routes.draw do
  get 'welcome/home'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :member, only: [:show] do
    get 'my_profile', on: :collection
  end

  root 'welcome#home'
end
