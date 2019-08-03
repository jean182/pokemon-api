# frozen_string_literal: true

class Pokemon < ApplicationRecord

  validates :name, :pokedex_number, presence: true
  validates :name, :slug, :pokedex_number, uniqueness: true
  belongs_to :region
  before_create :set_slug

  scope :region, ->(region) { joins(:region).merge(Region.where(name: region)) }

  private

  def set_slug
    self.slug = name.downcase.gsub(/\s+/, "-")
  end

end
