# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pokemons, path: "pokemon", param: :slug
    end
  end

  match "*a", to: "api/v1/errors#routing", via: %i[get post]
end
