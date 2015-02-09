class PagesController < ApplicationController

  # if there is a signed-in user, the homepage becomes that user's profile page
	def homepage
		redirect_to profile_path if current_user
	end

end 