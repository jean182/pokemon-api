# frozen_string_literal: true

module PopulatePokemon

  # Populates the pokemon table
  class Populate

    attr_reader :pokedex_number, :region

    def initialize(pokedex_number, region)
      @pokedex_number = pokedex_number
      @region = region
    end

    def populate
      create_pokemon
    end

    private

    def create_pokemon
      pokemon_instance = Pokemon.new(
        pokedex_number: pokemon.pokedex_number,
        name: pokemon.name,
        height: pokemon.height,
        weight: pokemon.weight,
        region_id: Region.where(name: region).first_or_create.id,
      )

      if pokemon_instance.save
        log("#{pokemon_instance.name} was added")
      else
        log(pokemon_instance.errors.messages)
      end
    end

    def pokemon
      @pokemon ||= PopulatePokemon::ApiResponse
                   .new(pokedex_number)
                   .pokemon
    end

    def log(message)
      return puts(message) unless Rails.env.test?

      Rails.logger.debug message
    end

  end

end
