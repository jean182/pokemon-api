# frozen_string_literal: true

class Api::V1::ApiController < ActionController::API

  include Response
  include ExceptionHandler

  def self.set_pagination_headers(name, options = {})
    after_action(options) do
      results = instance_variable_get("@#{name}")
      headers["X-Total"] = results.total_entries
      headers["X-Total-Pages"] = results.total_pages
      headers["X-Page"] = results.current_page
      headers["X-Per-Page"] = 10
      headers["X-Next-Page"] = results.next_page.presence || results.current_page
      headers["X-Prev-Page"] = results.previous_page.presence || results.current_page
    end
  end

end
