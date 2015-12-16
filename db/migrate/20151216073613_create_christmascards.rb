class CreateChristmascards < ActiveRecord::Migration
  def change
    create_table :christmascards do |t|
      t.string :tree
      t.string :lightone
      t.string :lighttwo
      t.string :lightthree
      t.string :flakeone
      t.string :flaketwo
      t.string :flakethree
      t.string :snow
      t.string :background
      t.string :border
      t.string :title
      t.string :titlecolor
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
