# frozen_string_literal: true

api_urls_file = Rails.root.join('config', 'api_urls.yml')
api_urls = YAML.safe_load(ERB.new(File.read(api_urls_file)).result, [], [], true)
               .with_indifferent_access[Rails.env]

# Configure faraday requests
GITHUB_API_URL = api_urls[:github_api_url]
