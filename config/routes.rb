# frozen_string_literal: true

Rails.application.routes.draw do
  root 'opinions#index'
  resources :opinions, only: %i[index create] do
    resources :comments, only: [:create]
  end

  devise_for :users, except: %i[show index]
  resources :users, only: %i[show index]
  get 'follow' => 'friendships#follow'
  post 'follow' => 'friendships#follow'
  delete 'unfollow' => 'friendships#unfollow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
