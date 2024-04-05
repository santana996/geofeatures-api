# frozen_string_literal: true

module Geofeatures
  class GeofeaturesService < ApplicationService
    attr_accessor :params,
                  :response

    def initialize(params)
      @params = params
      @response = []
    end

    def call
      api_process_data(make_request)
    end

    def make_request
      Httpclient::HttpclientService.call(params)
    end

    def api_process_data(data)
      data['features'].each do |feature|
        continue unless feature['type'].eql?('Feature')

        # Data Persist
        save_record(
          feature['properties'],
          feature['geometry']
        )
      end
    end

    def save_record(record, geometry)
      geofeature = GeoFeature.where(external_id: feature['ids']).first_or_initialize
      geofeature.title = record['title']
      geofeature.external_url = record['url']
      geofeature.magnitude = record['mag']
      geofeature.mag_type = record['magType']
      geofeature.place = record['place']
      geofeature.time = record['time']
      geofeature.tsunami = record['tsunami']
      geofeature.coordinate_longitud = geometry['coordinates'][0]
      geofeature.coordinate_latitude = geometry['coordinates'][1]
      geofeature.save
    end
  end
end
