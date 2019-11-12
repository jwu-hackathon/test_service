# frozen_string_literal: true

class GithubRepo
  include ActiveModel::Model

  attr_accessor :name,
                :full_name

  class << self
    def retrieve_octokit_repo
      response = ServiceClients::GithubRepoClient.retrieve_octokit_repo
      parsed_response = JSON.parse(response)

      new name: parsed_response['name'],
          full_name: parsed_response['full_name']
    end
  end
end
