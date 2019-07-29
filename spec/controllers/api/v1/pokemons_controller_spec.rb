# frozen_string_literal: true

require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Api::V1::PokemonsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Api::V1::Pokemon. As you add validations to Api::V1::Pokemon, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: Faker::Games::Pokemon.name,
      pokedex_number: rand(1..809),
      pokedex_entry: Faker::Lorem.paragraph,
      height: Faker::Measurement.height,
      weight: Faker::Measurement.weight,
    }
  end

  let(:invalid_attributes) do
    { name: "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::PokemonsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do

    context "valid param" do
      let(:pokemon) { create(:pokemon, valid_attributes) }

      it "returns a success response if slug is passed" do
        get :show, params: { slug: pokemon.slug.to_param }
        expect(response).to be_successful
      end

      it "returns a success response if pokedex number is passed" do
        get :show, params: { slug: pokemon.pokedex_number.to_param }
        expect(response).to be_successful
      end
    end

    context "invalid param" do
      it "returns a 404 status code" do
        get :show, params: { slug: "invalid-slug" }
        expect(response).to have_http_status(404)
      end
    end
  end

end
