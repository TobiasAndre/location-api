# frozen_string_literal: true

require "rails_helper"

describe LocationService do
  subject(:search) { described_class.new(params).perform }
  describe "#perform" do
    let(:params) do
      {
        string_location: "checkpoint charlie"
      }
    end
    context "when there is a location available" do
      let(:coordinates) {{ "lat": "52.5075075", "lon": "13.3903737" }}

      it "returns expected coordinates", :vcr do
        expect(search).to be_eql(coordinates)
      end
    end

    context "when the API call failed" do
      before do
        allow(RestClient).to(receive(:get).and_raise(RestClient::ExceptionWithResponse))
      end

      it "raises LocationUnavailable" do
        expect { search }.to raise_error(LocationAdapter::LocationUnavailable)
      end
    end
  end
end
