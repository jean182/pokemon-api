# frozen_string_literal: true

class Api::V1::PokemonsController < Api::V1::ApiController

  set_pagination_headers :pokemons, only: :index
  before_action :set_pokemon, only: :show

  def index
    @pokemons = Pokemon.paginate(page: params[:page], per_page: 10)

    json_response(@pokemons)
  end

  def show
    json_response(@pokemon)
  end

  private

  def set_pokemon
    @pokemon =
      Pokemon.find_by(slug: params[:slug]) || Pokemon.find_by!(pokedex_number: params[:slug])
  end

end
