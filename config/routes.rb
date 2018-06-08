# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  root 'welcome#index'

  # devise_scope :user do
  #   authenticated :user do
  #     root 'welcome#index', as: :authenticated_root
  #   end

  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end
end
