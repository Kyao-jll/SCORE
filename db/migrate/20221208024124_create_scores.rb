class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :prop_id
      t.boolean :thumb1
      t.boolean :thumb2
      t.boolean :thumb3
      t.float :overeall_score
      t.float :walking_distance_to_an_underground_station
      t.float :connectivity_to_several_tube_lines
      t.float :access_to_major_airports
      t.float :gyms_personal_training_sports_venues
      t.float :restaurants
      t.float :bars
      t.float :cafes_nearby
      t.float :communal_roof_terraces
      t.float :private_roof_terraces
      t.float :cycle_provisions
      t.float :concierge_service
      t.float :cafe
      t.float :dedicated_tenant_entrance_or_reception_desk
      t.float :smart_building_infrastructure
      t.float :natural_light
      t.float :epc
      t.float :breeam
      t.float :ability_to_expand
      t.float :ability_to_brand_building
      t.float :proximity_to_clients
      t.float :proximity_to_competitors
      t.float :specification
      t.float :ability_to_influence_design
      t.float :landlord_credibility
      t.float :pc_date
      t.float :early_access
      t.float :public_transport_connectivity
      t.float :private_transport_connectivity
      t.float :local_amenities
      t.float :building_amenities
      t.float :building_infrastructure
      t.float :staff_impact
      t.float :sustainability_wellness
      t.float :flexibility
      t.float :image_brand_profile
      t.float :competitor_client_access
      t.float :deliverability_and_specification
      t.float :timing
      t.text :comments

      t.timestamps
    end
  end
end
