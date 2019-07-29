# frozen_string_literal: true

require "rails_helper"

RSpec.describe Pokemon, type: :model do
  describe "#validations" do
    let!(:pokemon) { create(:pokemon) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:pokedex_number) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:pokedex_number) }
  end

  describe "#set_slug" do

    context("when slug is valid") do
      let(:pokemon) { create(:pokemon, name: "Bulbasaur") }
      let(:pokemon_with_spaces) { create(:pokemon, name: "Mime Jr") }

      it "should create a slug for the new pokemon" do
        expect(pokemon.slug).not_to be_empty
      end

      it "should be equal to the name downcase" do
        expect(pokemon.slug).to eq("bulbasaur")
      end

      it "should replace spaces with dashes" do
        expect(pokemon_with_spaces.slug).to eq("mime-jr")
      end
    end

    context("when slug is invalid") do
      let!(:pokemon) { create(:pokemon, name: "Bulbasaur") }
      let(:duplicate_pokemon) { create(:pokemon, name: "Bulbasaur") }

      it "should raise an error if record exists" do
        expect { duplicate_pokemon }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
