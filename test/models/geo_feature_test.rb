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
require "test_helper"

class GeoFeatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
