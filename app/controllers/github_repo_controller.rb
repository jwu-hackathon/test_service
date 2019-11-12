# frozen_string_literal: true

class GithubRepoController < ApplicationController
  def index
    response = {
      'octokit_repo_name': GithubRepo.retrieve_octokit_repo.name,
      'octokit_repo_full_name': GithubRepo.retrieve_octokit_repo.full_name
    }
    render status: status, json: response
  end
end
