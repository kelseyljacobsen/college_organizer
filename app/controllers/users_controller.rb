class UsersController < ApplicationController

	def new
		@user = User.new
	end 

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
		@user.safety_schools = []
		@user.target_schools = []
		@user.reach_schools = []

		if @user.save 
			session[:user_id] = @user.id.to_s
			redirect_to profile_path
		else
			render :new
		end 
		
	end 

	def profile
		@user = User.find(current_user)
	


	end 

	def update
		render plain: params
	end 

	def add_school
		@user = User.find(current_user)
		if params[:list] == "safety"
			@user.safety_schools.push(params[:id])
		elsif params[:list] == "target"
			@user.target_schools.push(params[:id])
		elsif params[:list] == "reach"
			@user.reach_schools.push(params[:id])
		end 

		if @user.save
			redirect_to profile_path
		end
	end

	def delete_school
		@user = User.find(current_user)
		if params[:list] == "safety"
			@user.safety_schools.delete(params[:id])
		end 

		if @user.save
			redirect_to profile_path
		end 
	end 


	# def destroy
	# 	@bean = Bean.find(params[:id])
	# 	@bean.destroy
	# 		redirect_to beans_path
	# end 
end 