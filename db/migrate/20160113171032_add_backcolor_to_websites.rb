class AddBackcolorToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :backcolor, :string
  end
end
