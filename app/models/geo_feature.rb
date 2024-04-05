# == Schema Information
#
# Table name: geo_features
#
#  id                  :bigint           not null, primary key
#  coordinate_latitude :float
#  coordinate_longitud :float
#  external_url        :string
#  mag_type            :string
#  magnitude           :float
#  place               :string
#  time                :bigint
#  title               :string
#  tsunami             :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  external_id         :string
#
class GeoFeature < ApplicationRecord
  validates :title, presence: true
  validates :external_url, presence: true
  validates :place, presence: true
  validates :mag_type, presence: true

  validates :magnitude, comparison: {
    greater_than_or_equal_to: -1.0,
    less_than_or_equal_to: 10.0
  }
  validates :coordinate_longitud,
            presence: true,
            comparison: {
              greater_than_or_equal_to: -180.0,
              less_than_or_equal_to: 180.0
            }

  validates :coordinate_latitude,
            presence: true,
            comparison: {
              greater_than_or_equal_to: -90.0,
              less_than_or_equal_to: 90.0
            }
end
