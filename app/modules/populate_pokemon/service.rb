# frozen_string_literal: true

module PopulatePokemon

  # Service to populate all pokemon
  class Service

    attr_reader :starting_number, :ending_number, :region

    def initialize(starting_number, ending_number, region)
      @starting_number = starting_number
      @ending_number = ending_number
      @region = region
    end

    def populate
      delete_all_mons
      (starting_number..ending_number)
        .each { |number| populate_pokemon(number) }
    end

    private

    def populate_pokemon(pokedex_number)
      puts "Trying to populate pokemon number: #{pokedex_number}"
      PopulatePokemon::Populate.new(pokedex_number, region).populate
      puts "--------------------------------------------------------------------------"
    rescue StandardError => e
      Rails.logger.error "Service Error: #{e}"
    end

    def delete_all_mons
      puts "Deleting all pokemon from #{region}."
      Pokemon.where(pokedex_number: starting_number..ending_number).destroy_all
    end

  end

end
