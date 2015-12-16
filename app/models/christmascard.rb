class Christmascard < ActiveRecord::Base
	belongs_to :user
	attr_accessible :tree, :lightone, :lighttwo, :lightthree, :snow, :background, :border, :title, :user_id
end
