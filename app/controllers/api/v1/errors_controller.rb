# frozen_string_literal: true

class Api::V1::ErrorsController < Api::V1::ApiController

  def routing
    json_response(
      {
        error: ActionController::RoutingError.new(
          "No route matches [#{request.method}] #{request.path}",
        ),
      },
      404,
    )
  end

end
