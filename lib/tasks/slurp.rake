namespace :slurp do
  desc "TODO"
  task properties: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "prop_list.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      p = Property.new
      p.meta_id=row["metaId"]
      p.meta_status=row["metaStatus"]
      p.prop_name=row["name"]
      p.size_sqft=row["propertySizeSqFt"]
      p.address1=row["address1"]
      p.address2=row["address2"]
      p.postcode=row["postcode"]
      p.lat=row["lat"]
      p.lon=row["lon"]
      p.location_description=row["locationDescription"]
      p.size_from_sqft=row["SizefromSqFt"]
      p.size_to_sqft=row["sizeToSqFt"]
      p.area_rent=row["areaRent"]
      p.thumbnail=row["thumb"]

      p.save
      puts "#{p.prop_name} saved"
    end

    puts "There are now #{Property.count} rows in the Property table"




  end

end
