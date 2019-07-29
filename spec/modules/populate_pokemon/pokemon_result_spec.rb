# frozen_string_literal: true

require "rails_helper"

module PopulatePokemon

  RSpec.describe PokemonResult do
    describe "#values_at" do
      context "when valid class methods are passed in" do
        let(:valid_values) do
          described_class.new(
            1,
            "bulbasaur",
            "7",
            "69",
          )
        end
        it { expect(valid_values.values_at(:name)).to include("Bulbasaur") }
      end
    end

    context "when non valid class method is passed in" do
      let(:invalid_value) do
        described_class.new(
          1,
          "bulbasaur",
          "7",
          "69",
        ).values_at(:dummy)
      end

      it { expect { invalid_value }.to raise_error(NoMethodError) }
    end

    context "when nothing is passed in" do
      let(:no_value) do
        described_class.new(
          1,
          "bulbasaur",
          "7",
          "69",
        ).values_at
      end

      it { expect(no_value).to match_array([]) }
    end
  end

end
