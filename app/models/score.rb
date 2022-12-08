# == Schema Information
#
# Table name: scores
#
#  id                                          :integer          not null, primary key
#  ability_to_brand_building                   :float
#  ability_to_expand                           :float
#  ability_to_influence_design                 :float
#  access_to_major_airports                    :float
#  bars                                        :float
#  breeam                                      :float
#  building_amenities                          :float
#  building_infrastructure                     :float
#  cafe                                        :float
#  cafes_nearby                                :float
#  comments                                    :text
#  communal_roof_terraces                      :float
#  competitor_client_access                    :float
#  concierge_service                           :float
#  connectivity_to_several_tube_lines          :float
#  cycle_provisions                            :float
#  dedicated_tenant_entrance_or_reception_desk :float
#  deliverability_and_specification            :float
#  early_access                                :float
#  epc                                         :float
#  flexibility                                 :float
#  gyms_personal_training_sports_venues        :float
#  image_brand_profile                         :float
#  landlord_credibility                        :float
#  local_amenities                             :float
#  natural_light                               :float
#  overeall_score                              :float
#  pc_date                                     :float
#  private_roof_terraces                       :float
#  private_transport_connectivity              :float
#  proximity_to_clients                        :float
#  proximity_to_competitors                    :float
#  public_transport_connectivity               :float
#  restaurants                                 :float
#  smart_building_infrastructure               :float
#  specification                               :float
#  staff_impact                                :float
#  sustainability_wellness                     :float
#  thumb1                                      :boolean
#  thumb2                                      :boolean
#  thumb3                                      :boolean
#  timing                                      :float
#  walking_distance_to_an_underground_station  :float
#  created_at                                  :datetime         not null
#  updated_at                                  :datetime         not null
#  prop_id                                     :integer
#  user_id                                     :integer
#
class Score < ApplicationRecord
belongs_to :user
belongs_to :property

end
