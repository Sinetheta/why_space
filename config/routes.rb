Rails.application.routes.draw do
  get 'welcome/home'
  devise_for :users

  resources :member, only: [:show]

  root 'welcome#home'
end
