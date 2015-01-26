class PagesController < ApplicationController

	def homepage
		redirect_to profile_path if current_user
	end

end 