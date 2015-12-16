class Christmascard < ActiveRecord::Base
	belongs_to :user
	attr_accessible :tree, :lightone, :lighttwo, :lightthree, :flakeone, :flaketwo, :flakethree, :snow, :background, :border, :title, :titlecolor, :user_id
end
