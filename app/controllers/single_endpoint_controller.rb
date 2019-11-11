# frozen_string_literal: true

class SingleEndpointController < ApplicationController

  # A custom single endpoint that renders a status and JSON
  def custom_single_endpoint
    render status: status, json: 'Single endpoint hit!'.to_json
  end
end
