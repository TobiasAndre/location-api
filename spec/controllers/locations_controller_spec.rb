# frozen_string_literal: true

require "rails_helper"

describe LocationsController, type: :request do
  describe "GET #convert" do
    context "when params is missing" do
      it "return unprocessable entity (422)", :vcr do
        get "/api/coordinates/search", params: {}
        expect(response).to have_http_status(422)
      end
    end
  end

  context "when request with valid params" do
    let(:location_params) { { location: "checkpoint charlie" } }
    it "return valid quote and status 200", :vcr do
      get "/api/coordinates/search", params: location_params
      expect(response).to have_http_status(200)
    end
  end

  context "when a failure occurs" do
    let(:location_params) { { location: 'AAA' } }
    before do
      allow(RestClient).to(receive(:get).and_raise(RestClient::ExceptionWithResponse))
    end

    it "rescue LocationUnavailable", :vcr do
      get "/api/coordinates/search", params: location_params
      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)).to eq("error" => "Location not found")
    end
  end
end