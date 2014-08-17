class AddFeaturesToBicycle < ActiveRecord::Migration
  def change
    add_column :bicycles, :properties, :hstore
    add_column :bicycles, :biketype, :string
    add_column :bicycles, :accessories, :hstore
  end
end
