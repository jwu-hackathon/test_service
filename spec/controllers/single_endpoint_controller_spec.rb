# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SingleEndpointController, type: :controller do
  describe '#custom_single_endpoint' do
    subject { get :custom_single_endpoint }

    it 'renders a 200 status' do
      expect(subject).to have_http_status(200)
    end

    it 'renders a JSON response' do
      expect(subject.body).to eq('Single endpoint hit!'.to_json)
    end
  end
end
