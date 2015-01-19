class UsersController < ApplicationController

	def new
		@user = User.new
	end 

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))

		if @user.save 
			redirect_to login_path
		else
			render :new
		end 
		
	end 

	def profile
		@user = User.find(current_user)
		@my_safety_schools = UserSafetySchool.all
		@my_target_schools = UserTargetSchool.all
		@my_reach_schools = UserReachSchool.all
	end 

end 