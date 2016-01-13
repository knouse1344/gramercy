class AddFootcolorToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :footcolor, :string
  end
end
