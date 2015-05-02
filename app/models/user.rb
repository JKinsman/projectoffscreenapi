class User < ActiveRecord::Base
  validates_uniqueness_of :username, case_sensitive: false
  acts_as_mappable default_units: :miles, 
                   default_formula: :sphere,
                   distance_field_name: :distance
                   lat_column_name: :latitude,
                   lng_column_name: :longitude
end
