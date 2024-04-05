# frozen_string_literal: true

module Httpclient
  class HttpclientService < ApplicationService
    include HTTParty
    base_uri ENV['BASE_URL'] || 'https://earthquake.usgs.gov'
    format :json

    attr_accessor :start_time,
                  :end_time,
                  :min_magnitud,
                  :order_by

    def initialize(params)
      @start_time = params[:start_time]
      @end_time = params[:end_time]
      @min_magnitud = params[:start_time]
      @order_by = params[:start_time]
    end

    def call
      query
    end

    def query
      self.class.get(
        '/fdsnws/event/1/query.geojson?',
        request
      )
    end

    def request
      {
        query: {
          starttime: start_time,
          endtime: end_time,
          minmagnitude: min_magnitud,
          orderby: order_by
        }
      }
    end
  end
end
