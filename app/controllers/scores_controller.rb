class ScoresController < ApplicationController

  
  def index
    matching_scores = Score.all

    @list_of_scores = matching_scores.order({ :created_at => :desc })

    render({ :template => "scores/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_scores = Score.where({ :id => the_id })

    @the_score = matching_scores.at(0)

    render({ :template => "scores/show.html.erb" })
  end

  def create
    the_score = Score.new
    the_score.user_id = params.fetch("query_user_id")
    the_score.property_id = params.fetch("query_prop_id")

    the_score.thumb1 = params.fetch("query_thumb1", false)
    the_score.thumb2 = params.fetch("query_thumb2", false)
    the_score.thumb3 = params.fetch("query_thumb3", false)

    the_score.staff_impact = params.fetch("query_natural_light")

    the_score.overall_score = ((params.fetch("query_walking_distance_to_an_underground_station").to_f + params.fetch("query_connectivity_to_several_tube_lines").to_f + params.fetch("query_access_to_major_airports").to_f + params.fetch("query_gyms/personal_training/sports_venues").to_f + params.fetch("query_restaurants").to_f + params.fetch("query_bars").to_f + params.fetch("query_cafes_nearby").to_f + params.fetch("query_communal_roof_terraces").to_f + params.fetch("query_private_roof_terraces").to_f + params.fetch("query_cycle_provisions").to_f + params.fetch("query_concierge_service").to_f + params.fetch("query_cafe").to_f + params.fetch("query_dedicated_tenant_entrance_or_reception_desk").to_f + params.fetch("query_smart_building_infrastructure").to_f + params.fetch("query_natural_light").to_f + params.fetch("query_epc").to_f + params.fetch("query_breeam").to_f + params.fetch("query_ability_to_expand").to_f + params.fetch("query_ability_to_brand_building").to_f + params.fetch("query_proximity_to_clients").to_f + params.fetch("query_proximity_to_competitors").to_f + params.fetch("query_specification").to_f + params.fetch("query_ability_to_influence_design").to_f + params.fetch("query_landlord_credibility").to_f + params.fetch("query_pc_date").to_f + params.fetch("query_early_access").to_f) / 26).round(2)

    the_score.public_transport_connectivity = (params.fetch("query_walking_distance_to_an_underground_station").to_f + params.fetch("query_connectivity_to_several_tube_lines").to_f) / 2
    the_score.walking_distance_to_an_underground_station = params.fetch("query_walking_distance_to_an_underground_station")
    the_score.connectivity_to_several_tube_lines = params.fetch("query_connectivity_to_several_tube_lines")

    the_score.access_to_major_airports = params.fetch("query_access_to_major_airports")
    the_score.private_transport_connectivity = params.fetch("query_access_to_major_airports")

    the_score.local_amenities = (params.fetch("query_gyms/personal_training/sports_venues").to_f + params.fetch("query_restaurants").to_f + params.fetch("query_bars").to_f + params.fetch("query_cafes_nearby").to_f) / 4
    the_score.gyms_personal_training_sports_venues = params.fetch("query_gyms/personal_training/sports_venues")
    the_score.restaurants = params.fetch("query_restaurants")
    the_score.bars = params.fetch("query_bars")
    the_score.cafes_nearby = params.fetch("query_cafes_nearby")

    the_score.building_amenities = (params.fetch("query_communal_roof_terraces").to_f + params.fetch("query_private_roof_terraces").to_f + params.fetch("query_cycle_provisions").to_f + params.fetch("query_concierge_service").to_f + params.fetch("query_cafe").to_f + params.fetch("query_dedicated_tenant_entrance_or_reception_desk").to_f) / 6
    the_score.communal_roof_terraces = params.fetch("query_communal_roof_terraces")
    the_score.private_roof_terraces = params.fetch("query_private_roof_terraces")
    the_score.cycle_provisions = params.fetch("query_cycle_provisions")
    the_score.concierge_service = params.fetch("query_concierge_service")
    the_score.cafe = params.fetch("query_cafe")
    the_score.dedicated_tenant_entrance_or_reception_desk = params.fetch("query_dedicated_tenant_entrance_or_reception_desk")

    the_score.building_infrastructure = params.fetch("query_smart_building_infrastructure")
    the_score.smart_building_infrastructure = params.fetch("query_smart_building_infrastructure")

    the_score.staff_impact = params.fetch("query_natural_light")
    the_score.natural_light = params.fetch("query_natural_light")

    the_score.sustainability_wellness = (params.fetch("query_epc").to_f + params.fetch("query_breeam").to_f) / 2
    the_score.epc = params.fetch("query_epc")
    the_score.breeam = params.fetch("query_breeam")

    the_score.flexibility = params.fetch("query_ability_to_expand")
    the_score.ability_to_expand = params.fetch("query_ability_to_expand")

    the_score.image_brand_profile = params.fetch("query_ability_to_brand_building")
    the_score.ability_to_brand_building = params.fetch("query_ability_to_brand_building")

    the_score.competitor_client_access = (params.fetch("query_proximity_to_clients").to_f + params.fetch("query_proximity_to_competitors").to_f) / 2
    the_score.proximity_to_clients = params.fetch("query_proximity_to_clients")
    the_score.proximity_to_competitors = params.fetch("query_proximity_to_competitors")

    the_score.deliverability_and_specification = (params.fetch("query_specification").to_f + params.fetch("query_ability_to_influence_design").to_f + params.fetch("query_landlord_credibility").to_f) / 3
    the_score.specification = params.fetch("query_specification")
    the_score.ability_to_influence_design = params.fetch("query_ability_to_influence_design")
    the_score.landlord_credibility = params.fetch("query_landlord_credibility")

    the_score.timing = (params.fetch("query_pc_date").to_f + params.fetch("query_early_access").to_f) / 2
    the_score.pc_date = params.fetch("query_pc_date")
    the_score.early_access = params.fetch("query_early_access")

    the_score.comments = params.fetch("query_comments")

    if the_score.valid?
      the_score.save
      redirect_to("/properties/#{the_score.property_id}", { :notice => "Score created successfully." })
    else
      redirect_to("/scores", { :alert => the_score.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_score = Score.where({ :id => the_id }).at(0)

    the_score.user_id = params.fetch("query_user_id")
    the_score.property_id = params.fetch("query_prop_id")
    
    the_score.thumb1 = params.fetch("query_thumb1", false)
    the_score.thumb2 = params.fetch("query_thumb2", false)
    the_score.thumb3 = params.fetch("query_thumb3", false)

    the_score.staff_impact = params.fetch("query_natural_light")

    the_score.overall_score = ((params.fetch("query_walking_distance_to_an_underground_station").to_f + params.fetch("query_connectivity_to_several_tube_lines").to_f + params.fetch("query_access_to_major_airports").to_f + params.fetch("query_gyms/personal_training/sports_venues").to_f + params.fetch("query_restaurants").to_f + params.fetch("query_bars").to_f + params.fetch("query_cafes_nearby").to_f + params.fetch("query_communal_roof_terraces").to_f + params.fetch("query_private_roof_terraces").to_f + params.fetch("query_cycle_provisions").to_f + params.fetch("query_concierge_service").to_f + params.fetch("query_cafe").to_f + params.fetch("query_dedicated_tenant_entrance_or_reception_desk").to_f + params.fetch("query_smart_building_infrastructure").to_f + params.fetch("query_natural_light").to_f + params.fetch("query_epc").to_f + params.fetch("query_breeam").to_f + params.fetch("query_ability_to_expand").to_f + params.fetch("query_ability_to_brand_building").to_f + params.fetch("query_proximity_to_clients").to_f + params.fetch("query_proximity_to_competitors").to_f + params.fetch("query_specification").to_f + params.fetch("query_ability_to_influence_design").to_f + params.fetch("query_landlord_credibility").to_f + params.fetch("query_pc_date").to_f + params.fetch("query_early_access").to_f) / 26).round(2)

    the_score.public_transport_connectivity = (params.fetch("query_walking_distance_to_an_underground_station").to_f + params.fetch("query_connectivity_to_several_tube_lines").to_f) / 2
    the_score.walking_distance_to_an_underground_station = params.fetch("query_walking_distance_to_an_underground_station")
    the_score.connectivity_to_several_tube_lines = params.fetch("query_connectivity_to_several_tube_lines")

    the_score.access_to_major_airports = params.fetch("query_access_to_major_airports")
    the_score.private_transport_connectivity = params.fetch("query_access_to_major_airports")

    the_score.local_amenities = (params.fetch("query_gyms/personal_training/sports_venues").to_f + params.fetch("query_restaurants").to_f + params.fetch("query_bars").to_f + params.fetch("query_cafes_nearby").to_f) / 4
    the_score.gyms_personal_training_sports_venues = params.fetch("query_gyms/personal_training/sports_venues")
    the_score.restaurants = params.fetch("query_restaurants")
    the_score.bars = params.fetch("query_bars")
    the_score.cafes_nearby = params.fetch("query_cafes_nearby")

    the_score.building_amenities = (params.fetch("query_communal_roof_terraces").to_f + params.fetch("query_private_roof_terraces").to_f + params.fetch("query_cycle_provisions").to_f + params.fetch("query_concierge_service").to_f + params.fetch("query_cafe").to_f + params.fetch("query_dedicated_tenant_entrance_or_reception_desk").to_f) / 6
    the_score.communal_roof_terraces = params.fetch("query_communal_roof_terraces")
    the_score.private_roof_terraces = params.fetch("query_private_roof_terraces")
    the_score.cycle_provisions = params.fetch("query_cycle_provisions")
    the_score.concierge_service = params.fetch("query_concierge_service")
    the_score.cafe = params.fetch("query_cafe")
    the_score.dedicated_tenant_entrance_or_reception_desk = params.fetch("query_dedicated_tenant_entrance_or_reception_desk")

    the_score.building_infrastructure = params.fetch("query_smart_building_infrastructure")
    the_score.smart_building_infrastructure = params.fetch("query_smart_building_infrastructure")

    the_score.staff_impact = params.fetch("query_natural_light")
    the_score.natural_light = params.fetch("query_natural_light")

    the_score.sustainability_wellness = (params.fetch("query_epc").to_f + params.fetch("query_breeam").to_f) / 2
    the_score.epc = params.fetch("query_epc")
    the_score.breeam = params.fetch("query_breeam")

    the_score.flexibility = params.fetch("query_ability_to_expand")
    the_score.ability_to_expand = params.fetch("query_ability_to_expand")

    the_score.image_brand_profile = params.fetch("query_ability_to_brand_building")
    the_score.ability_to_brand_building = params.fetch("query_ability_to_brand_building")

    the_score.competitor_client_access = (params.fetch("query_proximity_to_clients").to_f + params.fetch("query_proximity_to_competitors").to_f) / 2
    the_score.proximity_to_clients = params.fetch("query_proximity_to_clients")
    the_score.proximity_to_competitors = params.fetch("query_proximity_to_competitors")

    the_score.deliverability_and_specification = (params.fetch("query_specification").to_f + params.fetch("query_ability_to_influence_design").to_f + params.fetch("query_landlord_credibility").to_f) / 3
    the_score.specification = params.fetch("query_specification")
    the_score.ability_to_influence_design = params.fetch("query_ability_to_influence_design")
    the_score.landlord_credibility = params.fetch("query_landlord_credibility")

    the_score.timing = (params.fetch("query_pc_date").to_f + params.fetch("query_early_access").to_f) / 2
    the_score.pc_date = params.fetch("query_pc_date")
    the_score.early_access = params.fetch("query_early_access")

    the_score.comments = params.fetch("query_comments")

    if the_score.valid?
      the_score.save
      redirect_to("/properties/#{the_score.property_id}", { :notice => "Score updated successfully." })

    else
      redirect_to("/scores/#{the_score.id}", { :alert => the_score.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_score = Score.where({ :id => the_id }).at(0)

    the_score.destroy

    redirect_to("/scores", { :notice => "Score deleted successfully." })
  end
end
