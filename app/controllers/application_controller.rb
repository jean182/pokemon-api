# frozen_string_literal: true

class ApplicationController < ActionController::API

  include ActionController::MimeResponds
  include Response
  include ExceptionHandler

  respond_to :json

  # Devise custom methods
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: "400",
          title: "Bad Request",
          detail: resource.errors,
          code: "100",
        },
      ],
    }, status: :bad_request
  end

end
