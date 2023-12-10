# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'

  resources :create_opportunities

  get '/api/send_text', to: 'api#send_text'

  get 'discoveroppotunites', to: 'discover_opportunities#search', as: 'search_opportunities'

  get 'discoveroppotunites/:id', to: 'discover_opportunities#show', as: 'show_opportunity'

  get 'discoveropportunities/:id/edit', to: 'discover_opportunities#edit', as: 'edit_opportunity'
end
