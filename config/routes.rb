Rails.application.routes.draw do
  get 'welcome/home'
  devise_for :users

  root 'welcome#home'
end
