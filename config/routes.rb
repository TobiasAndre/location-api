# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    get "coordinates/search", to: "locations#search_coordinates"
  end
end
