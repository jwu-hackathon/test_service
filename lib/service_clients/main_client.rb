# frozen_string_literal: true

# Use module for folders
module ServiceClients
  # Use class for files
  class MainClient
    class << self
      def http_get(request_url, endpoint_uri, options = {})
        response = configure(request_url, options).get(endpoint_uri)
        handle_response(response, request_url + endpoint_uri)
      end

      private

      def handle_response(response, path)
        return response.body if [200, 204].include? response.status

        error = {
          400 => TestService::Errors::BadRequestError.new(response.status, path, response.body),
          401 => TestService::Errors::UnauthorizedRequestError.new(response.status, path, response.body),
          403 => TestService::Errors::ForbiddenRequestError.new(response.status, path, response.body),
          404 => TestService::Errors::ResourceNotFoundError.new(response.status, path, 'Resource Not Found'),
          422 => TestService::Errors::UnprocessableEntityError.new(response.status, path, response.body),
        }.fetch(response.status, TestService::Errors::BadHttpResponseError.new(response.status, path, response.body))
        raise error
      end

      def configure(request_url, options = {})
        Faraday.new(request_url, options[:faraday]) do |faraday|
          faraday.options.params_encoder = Faraday::FlatParamsEncoder
          faraday.options.timeout = api_config['read_timeout_default'].to_i
          faraday.options.open_timeout = api_config['open_timeout_default'].to_i
          faraday.headers = options.fetch(:headers, {})
          faraday.request   :retry, max: api_config[:retries_default], interval: 0.05
          faraday.adapter Faraday.default_adapter
        end
      end

      def api_config
        ::Rails.application.config_for(:api_urls).with_indifferent_access
      end
    end
  end
end
