# frozen_string_literal: true

module ExceptionHandler

  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      name_or_num = params[:slug].is_integer? ? "id" : "name"
      message_error = "#{error.message} with #{name_or_num} #{params[:slug]}"
      json_response({ error: message_error }, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({ error: error.message }, 422)
    end
  end

end
