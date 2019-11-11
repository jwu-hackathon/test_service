Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Route for custom_single_endpoint with a custom url path
  # /single-endpoint
  get 'single-endpoint', to: 'single_endpoint#custom_single_endpoint'

  # Route for custom_single_endpoint with a custom url path
  # /single-endpoint-custom
  get :custom_single_endpoint, to: 'single_endpoint#custom_single_endpoint', path: '/single-endpoint-custom'

  # Another route for custom_single_endpoint without a custom url path
  # /custom_single_endpoint
  get :custom_single_endpoint, to: 'single_endpoint#custom_single_endpoint'
end
