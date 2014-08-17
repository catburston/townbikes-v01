class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string    :city
      t.string    :country
      t.string    :address
      t.string    :postcode
      t.integer   :bicycle_id
      t.timestamps
    end
  end
end
