class PropertiesController < ApplicationController

  def analyze
    matching_properties = Property.all

    @list_of_properties = matching_properties.order({ :created_at => :desc })

    render({ :template => "/bubbles.html.erb" })
  end
  
  def user_index
    matching_properties = Property.all


    @list_of_properties = matching_properties.includes(:scores).order("scores.overall_score desc") 

    render({ :template => "properties/user_index.html.erb" })
  end
  
  def index
    matching_properties = Property.all

    @list_of_properties = matching_properties.order({ :created_at => :desc })

    render({ :template => "properties/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_properties = Property.where({ :id => the_id })

    @the_property = matching_properties.at(0)

    render({ :template => "properties/show.html.erb" })
  end

  def create
    the_property = Property.new
    the_property.address1 = params.fetch("query_address1")
    the_property.address2 = params.fetch("query_address2")
    the_property.lat = params.fetch("query_lat")
    the_property.location_description = params.fetch("query_location_description")
    the_property.lon = params.fetch("query_lon")
    the_property.meta_status = params.fetch("query_meta_status")
    the_property.postcode = params.fetch("query_postcode")
    the_property.prop_name = params.fetch("query_prop_name")
    the_property.area_rent = params.fetch("query_area_rent")
    the_property.thumbnail = params.fetch("query_thumbnail")
    the_property.size_sqft = params.fetch("query_size_sqft")
    the_property.size_from_sqft = params.fetch("query_size_from_sqft")
    the_property.size_to_sqft = params.fetch("query_size_to_sqft")
    the_property.meta_id = params.fetch("query_meta_id")

    if the_property.valid?
      the_property.save
      redirect_to("/properties", { :notice => "Property created successfully." })
    else
      redirect_to("/properties", { :alert => the_property.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_property = Property.where({ :id => the_id }).at(0)

    the_property.address1 = params.fetch("query_address1")
    the_property.address2 = params.fetch("query_address2")
    the_property.lat = params.fetch("query_lat")
    the_property.location_description = params.fetch("query_location_description")
    the_property.lon = params.fetch("query_lon")
    the_property.meta_status = params.fetch("query_meta_status")
    the_property.postcode = params.fetch("query_postcode")
    the_property.prop_name = params.fetch("query_prop_name")
    the_property.area_rent = params.fetch("query_area_rent")
    the_property.thumbnail = params.fetch("query_thumbnail")
    the_property.size_sqft = params.fetch("query_size_sqft")
    the_property.size_from_sqft = params.fetch("query_size_from_sqft")
    the_property.size_to_sqft = params.fetch("query_size_to_sqft")
    the_property.meta_id = params.fetch("query_meta_id")

    if the_property.valid?
      the_property.save
      redirect_to("/properties/#{the_property.id}", { :notice => "Property updated successfully."} )
    else
      redirect_to("/properties/#{the_property.id}", { :alert => the_property.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_property = Property.where({ :id => the_id }).at(0)

    the_property.destroy

    redirect_to("/properties", { :notice => "Property deleted successfully."} )
  end
end
