class AddFontcolorToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :fontcolor, :string
  end
end
