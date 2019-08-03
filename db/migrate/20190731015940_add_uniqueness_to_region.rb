# frozen_string_literal: true

class AddUniquenessToRegion < ActiveRecord::Migration[5.2]
  def change
    add_column :regions, :slug, :string, null: false
    add_index :regions, :slug, unique: true
  end
end
