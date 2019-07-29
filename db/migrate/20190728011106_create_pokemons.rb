# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.integer :pokedex_number, null: false
      t.text :pokedex_entry
      t.string :height
      t.string :weight
      t.string :slug, null: false

      t.timestamps
    end
  end
end
