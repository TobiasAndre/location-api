require 'swagger_helper'

describe "Locations API" do

  path "/api/coordinates/search" do

    parameter in: :query, name: :location, type: :string, description: "The location name or address", required: true
    
    let(:location) { "checkpoint charlie"}

    get "Search location coordinates" do
      tags "Location coordinates"
      produces 'application/json'

      response "200", "location found" do
        let(:location) { "checkpoint charlie"}
        run_test!
      end

      response "404", "location not found" do
        let(:location){"."}
        run_test!
      end

      response "422", "all parameters are required" do
        let(:location){""}
        run_test!
      end
    end
  end
end