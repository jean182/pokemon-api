# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: "api/v1/users", controllers: { sessions: "api/v1/sessions", registrations: "api/v1/registrations" }
  namespace :api do
    namespace :v1 do
      resources :pokemons, path: "pokemon", param: :slug, only: %i[index show]
      resources :regions, param: :slug, only: %i[index show]
    end
  end

  match "*a", to: "api/v1/errors#routing", via: %i[get post]
end
