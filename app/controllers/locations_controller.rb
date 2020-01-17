# frozen_string_literal: true

class LocationsController < ApplicationController
  def search_coordinates
    return params_missing? if empty_params?

    coordinates = Rails.cache.fetch(cache_key, expires_in: 30.days) do
      LocationService.new(location_params).perform
    end

    render json: coordinates.to_json
  rescue LocationAdapter::LocationUnavailable
    render json: { error: "Location not found" }, status: :unprocessable_entity
  end

  private

  def empty_params?
    params[:location].blank?
  end

  def params_missing?
    render json: { "message": "all parameters are required" }, status: :unprocessable_entity
  end

  def location_params
    {
      string_location: params.dig(:location)
    }
  end

  def cache_key
    "#{params.dig(:location)}"
  end
end
