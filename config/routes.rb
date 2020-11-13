Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :friendships, only: [:create]

  resources :members, only: [:index, :show] do
    get 'my_profile', on: :collection
    post 'topic_experts', controller: 'member_searches'
  end

  root 'members#index'
end
