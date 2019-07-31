# frozen_string_literal: true

module PopulatePokemon

  # Fetches the pokemon data from PokeAPI
  class ApiResponse

    attr_reader :pokemon_number

    def initialize(pokemon_number)
      @pokemon_number = pokemon_number
    end

    def pokemon
      @pokemon = PopulatePokemon::PokemonResult.new(
        result[:id],
        result[:name],
        result[:height],
        result[:weight],
      )
    end

    private

    def result
      @result ||= connection.get.body.transform_keys!(&:to_sym)
    end

    def connection
      @connection =
        Faraday.new(url: "#{base_url}#{pokemon_number}") do |faraday|
          faraday.response :json
          faraday.adapter Faraday.default_adapter
        end
    end

    def base_url
      @base_url = "https://pokeapi.co/api/v2/pokemon/"
    end

  end

end
