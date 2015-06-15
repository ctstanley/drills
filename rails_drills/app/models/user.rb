class User < ActiveRecord::Base
	validates_presence_of :email, :password_digest, :presence => true
	validates_uniqueness_of :email
	has_secure_password
	has_many :articles

	def self.confirm (params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
