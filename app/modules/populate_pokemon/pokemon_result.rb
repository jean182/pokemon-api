# frozen_string_literal: true

module PopulatePokemon

  # Creates a class containing the attributes of the pokemon
  class PokemonResult

    attr_reader :name, :pokedex_number, :height, :weight

    def initialize(pokedex_number, name, height, weight)
      @pokedex_number = pokedex_number
      @name = name.gsub("-", "_").humanize
      @height = height
      @weight = weight
    end

    def values_at(*args)
      args.map { |method_name| public_send method_name }
    end

  end

end
