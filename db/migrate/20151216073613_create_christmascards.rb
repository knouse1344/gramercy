class CreateChristmascards < ActiveRecord::Migration
  def change
    create_table :christmascards do |t|
      t.string :tree
      t.string :lightone
      t.string :lighttwo
      t.string :lightthree
      t.string :snow
      t.string :background
      t.string :border
      t.string :title
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
