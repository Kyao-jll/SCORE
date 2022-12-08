# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_08_025515) do

  create_table "properties", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.float "lat"
    t.text "location_description"
    t.float "lon"
    t.string "meta_status"
    t.string "postcode"
    t.string "prop_name"
    t.float "area_rent"
    t.string "thumbnail"
    t.float "size_sqft"
    t.float "size_from_sqft"
    t.float "size_to_sqft"
    t.integer "meta_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "prop_id"
    t.boolean "thumb1"
    t.boolean "thumb2"
    t.boolean "thumb3"
    t.float "overeall_score"
    t.float "walking_distance_to_an_underground_station"
    t.float "connectivity_to_several_tube_lines"
    t.float "access_to_major_airports"
    t.float "gyms_personal_training_sports_venues"
    t.float "restaurants"
    t.float "bars"
    t.float "cafes_nearby"
    t.float "communal_roof_terraces"
    t.float "private_roof_terraces"
    t.float "cycle_provisions"
    t.float "concierge_service"
    t.float "cafe"
    t.float "dedicated_tenant_entrance_or_reception_desk"
    t.float "smart_building_infrastructure"
    t.float "natural_light"
    t.float "epc"
    t.float "breeam"
    t.float "ability_to_expand"
    t.float "ability_to_brand_building"
    t.float "proximity_to_clients"
    t.float "proximity_to_competitors"
    t.float "specification"
    t.float "ability_to_influence_design"
    t.float "landlord_credibility"
    t.float "pc_date"
    t.float "early_access"
    t.float "public_transport_connectivity"
    t.float "private_transport_connectivity"
    t.float "local_amenities"
    t.float "building_amenities"
    t.float "building_infrastructure"
    t.float "staff_impact"
    t.float "sustainability_wellness"
    t.float "flexibility"
    t.float "image_brand_profile"
    t.float "competitor_client_access"
    t.float "deliverability_and_specification"
    t.float "timing"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "company"
    t.string "industry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
