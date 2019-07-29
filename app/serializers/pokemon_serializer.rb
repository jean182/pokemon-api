# frozen_string_literal: true

class PokemonSerializer < ActiveModel::Serializer

  attributes :pokedex_number, :name, :pokedex_entry, :weight, :height

end
