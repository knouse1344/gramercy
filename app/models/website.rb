class Website < ActiveRecord::Base
	belongs_to :user
	attr_accessible :fontcolor, :footcolor, :backcolor, :heading, :profile, :image, :description, :footer, :user_id
	mount_uploader :profile, ProfileUploader
end
