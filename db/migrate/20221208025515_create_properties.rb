class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :address1
      t.string :address2
      t.float :lat
      t.text :location_description
      t.float :lon
      t.string :meta_status
      t.string :postcode
      t.string :prop_name
      t.float :area_rent
      t.string :thumbnail
      t.float :size_sqft
      t.float :size_from_sqft
      t.float :size_to_sqft
      t.integer :meta_id

      t.timestamps
    end
  end
end
