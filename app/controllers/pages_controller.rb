class PagesController < ApplicationController

	def homepage
		redirect_to profile_path if current_user
	end

	def terms_of_service
	end 

	def support
	end 

end 