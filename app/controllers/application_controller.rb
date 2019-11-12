class ApplicationController < ActionController::Base
  include ErrorHandler

  # Test Service Error Handling
  rescue_from TestService::Errors::BadRequestError, with: :handle_bad_request_error
  rescue_from TestService::Errors::UnauthorizedRequestError, with: :handle_unauthorized_error
  rescue_from TestService::Errors::ForbiddenRequestError, with: :handle_forbidden_error
  rescue_from TestService::Errors::ResourceNotFoundError, with: :handle_resource_not_found_error
  rescue_from TestService::Errors::UnprocessableEntityError, with: :handle_unprocessable_entity_error
  rescue_from TestService::Errors::BadHttpResponseError, with: :handle_bad_http_response_error
  rescue_from TestService::Errors::ServiceError, with: :handle_service_error
end
