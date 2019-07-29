# frozen_string_literal: true

require "rails_helper"

module PopulatePokemon

  RSpec.describe ApiResponse do
    describe "#pokemon" do
      context "when response is valid" do
        let(:response) { described_class.new(1) }
        let(:valid_result) do
          {
            id: 1,
            name: "bulbasaur",
            weight: "7",
            height: "69",
          }
        end

        it "creates a new PokemonResult instance" do
          allow(response).to receive(:result) { valid_result }
          expect(response.pokemon).to be_an_instance_of(PopulatePokemon::PokemonResult)
        end

        it "attributes are the same as the response" do
          allow(response).to receive(:result) { valid_result }

          expect(response.pokemon.pokedex_number).to eq(valid_result[:id])
          expect(response.pokemon.name).to eq(valid_result[:name].humanize)
          expect(response.pokemon.weight).to eq(valid_result[:weight])
          expect(response.pokemon.height).to eq(valid_result[:height])
        end
      end

      context "when response does not return anything" do
        let(:response) { described_class.new(1) }
        let(:invalid_result) { {} }

        it "raises a no method error" do
          allow(response).to receive(:result) { invalid_result }
          expect { response.pokemon }.to raise_error(NoMethodError)
        end
      end
    end
  end

end
