class AddDescriptionToBicycle < ActiveRecord::Migration
  def change
    add_column :bicycles, :description, :text
  end
end
