require 'swagger_helper'

describe "Locations API" do

  path "/api/coordinates/search" do
  
    parameter in: :query, name: :location, schema: { type: :string }, description: "The location name or address", required: true

    get "Search location coordinates" do
      tags "Location coordinates"
      produces 'application/json'
      security [ bearerAuth: [] ]

      response "200", "location found" do
        let(:location) { "checkpoint charlie" }
        #run_test!
      end

      response "422", "location not found" do
        let(:location){"."}
        #run_test!
      end
    end
  end
end