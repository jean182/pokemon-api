# frozen_string_literal: true

class AddRegionToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_reference :pokemons, :region, foreign_key: true
  end
end
