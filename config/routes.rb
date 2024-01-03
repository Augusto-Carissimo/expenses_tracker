# frozen_string_literal: true

Rails.application.routes.draw do
  get 'expenses/create'
  get 'expenses/update'
  get 'expenses/destroy'
  root "home#index"
  resources :types
  resources :expenses
end
