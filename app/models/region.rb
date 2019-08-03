# frozen_string_literal: true

class Region < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :pokemons
  before_create :set_slug

  private

  def set_slug
    self.slug = name.downcase.gsub(/\s+/, "-")
  end

end
