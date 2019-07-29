# frozen_string_literal: true

class AddUniquenessToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_index :pokemons, :slug, unique: true
  end
end
