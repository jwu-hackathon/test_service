# frozen_string_literal: true

module ServiceClients
  class GithubRepoClient
    class << self

      def retrieve_octokit_repo
        endpoint_uri = '/repos/octokit/octokit.rb'
        get(GITHUB_API_URL, endpoint_uri)
      end

      private

      def get(request_url, endpoint_uri)
        response = ServiceClients::MainClient.http_get(request_url, endpoint_uri)
      end
    end
  end
end
