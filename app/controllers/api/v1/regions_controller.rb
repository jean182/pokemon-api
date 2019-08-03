# frozen_string_literal: true

class Api::V1::RegionsController < Api::V1::ApiController

  before_action :set_region, only: :show

  def index
    @regions = Region.all

    json_response(@regions)
  end

  def show
    json_response(@region)
  end

  private

  def set_region
    @region =
      Region.find_by(slug: params[:slug]) || Region.find_by!(id: params[:slug])
  end

end
