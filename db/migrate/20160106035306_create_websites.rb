class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :heading
      t.string :profile
      t.string :image
      t.text :description
      t.text :footer
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
