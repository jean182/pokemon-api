# frozen_string_literal: true

require "rails_helper"

module PopulatePokemon

  RSpec.describe Populate do
    describe "#populate" do
      context "creates new pokemon when valid data is passed" do
        let(:populate) { described_class.new(1) }
        let(:valid_result) do
          PokemonResult.new(
            1,
            "bulbasaur",
            "7",
            "69",
          )
        end

        it "creates a new pokemon" do
          allow(populate).to receive(:pokemon) { valid_result }
          expect do
            populate.populate
          end.to change(Pokemon, :count).by(1)
        end

      end

      context "does not create a new pokemon when invalid data is passed in" do
        let(:populate) { described_class.new(1) }
        let(:invalid_result) do
          PokemonResult.new(
            1,
            "",
            "7",
            "69",
          )
        end

        it "does not create a new pokemon" do
          allow(populate).to receive(:pokemon) { invalid_result }
          expect do
            populate.populate
          end.to change(Pokemon, :count).by(0)
        end
      end

    end

  end

end
