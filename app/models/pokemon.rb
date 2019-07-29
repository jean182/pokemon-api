# frozen_string_literal: true

class Pokemon < ApplicationRecord

  validates :name, :pokedex_number, presence: true
  validates :name, :slug, :pokedex_number, uniqueness: true
  before_create :set_slug

  private

  def set_slug
    self.slug = name.downcase.gsub(/\s+/, "-")
  end

end
