class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer   :renter_user_id
      t.integer   :owner_user_id
      t.integer   :bicycle_id
      t.datetime  :from_date
      t.datetime  :to_date
      t.timestamps
    end
  end
end
