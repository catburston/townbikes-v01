class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string    :make
      t.string    :model
      t.integer   :size
      t.integer   :daily_cost
      t.timestamps
    end
  end
end
