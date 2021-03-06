class User < ActiveRecord::Base
	has_many :christmascards, dependent: :destroy
	has_many :websites, dependent: :destroy
	attr_accessible :username, :password, :password_confirmation
	has_secure_password

	before_save { self.username = username.downcase }
	before_create :create_remember_token
	validates :username, uniqueness: true

	def User.new_remember_token
	SecureRandom.urlsafe_base64
	end

	def User.digest(token)
	Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
		  self.remember_token = User.digest(User.new_remember_token)
		end
end