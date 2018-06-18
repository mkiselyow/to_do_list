# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, 
    skip: [:session, :registration, :password], 
    controllers: { 
    registrations: 'registrations', 
    sessions: 'sessions' }
  root 'welcome#index'

  as :user do
    get 'users/sign_in', to: 'sessions#new', as: 'new_user_session'
    post 'users/sign_in', to: 'sessions#create', as: 'user_session'
    delete 'users/sign_out', to: 'sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up', to: 'registrations#new', as: 'new_user_registration'
    post 'users/sign_up', to: 'registrations#create', as: 'user_registration'
    delete 'users/sign_up', to: 'registrations#destroy', as: 'destroy_user_registration'
  end

  resources :projects, only: %i(create destroy edit update) do
    resources :tasks, only: %i(create destroy edit update)
  end
end