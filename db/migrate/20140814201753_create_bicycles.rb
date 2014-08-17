class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.integer   :user_id
      t.string    :make
      t.string    :bicycle_model
      t.integer   :size
      t.integer   :daily_cost
      t.timestamps
    end
  end
end
