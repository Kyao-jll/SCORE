# == Schema Information
#
# Table name: properties
#
#  id                   :integer          not null, primary key
#  address1             :string
#  address2             :string
#  area_rent            :float
#  lat                  :float
#  location_description :text
#  lon                  :float
#  meta_status          :string
#  postcode             :string
#  prop_name            :string
#  size_from_sqft       :float
#  size_sqft            :float
#  size_to_sqft         :float
#  thumbnail            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  meta_id              :integer
#
class Property < ApplicationRecord
  has_many :scores

  has_many :rating, :through => :scores , :source => :user
end
