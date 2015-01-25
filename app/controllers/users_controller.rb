class UsersController < ApplicationController

	before_action :authorize, except: [:new, :create]

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
			flash[:info] = "Welcome! Start adding schools to your list!" 
			redirect_to profile_path
		else
			flash.now[:danger] = @user.errors.full_messages.to_sentence
			render :new
		end 

	end 

	def profile
		@user = User.find(current_user)
	end 

	def update
	
	end 

	def add_school
		@user = User.find(current_user)
		school = params[:id]
		school_name = School.find(params[:id]).name
		if params[:list] == "safety" && @user.safety_schools.exclude?(school) && @user.target_schools.exclude?(school) && @user.reach_schools.exclude?(school)
			@user.safety_schools.push(school)
			flash[:info] = "#{school_name} added as a safety school!" 

		elsif params[:list] == "target" && @user.safety_schools.exclude?(school) && @user.target_schools.exclude?(school) && @user.reach_schools.exclude?(school)
			@user.target_schools.push(school)
			flash[:info] = "#{school_name} added as a target school!" 

		elsif params[:list] == "reach" && @user.safety_schools.exclude?(school) && @user.target_schools.exclude?(school) && @user.reach_schools.exclude?(school)
			@user.reach_schools.push(school)
			flash[:info] = "#{school_name} added as a reach school!" 

		elsif @user.safety_schools.include?(school) 
			flash[:danger] = "#{school_name} is already included as a safety school!" 

		elsif @user.target_schools.include?(school)
			flash[:danger] = "#{school_name} is already included as a target school!"

		elsif @user.reach_schools.include?(school)
			flash[:danger] = "#{school_name} is already included as a reach school!"  
		end 

		if @user.save
			redirect_to profile_path
		end 

	end

	def delete_school
		@user = User.find(current_user)
		school = params[:id]
		school_name = School.find(params[:id]).name
		if params[:list] == "safety"
			@user.safety_schools.delete(school)
			flash[:info] = "#{school_name} deleted from list."
		elsif params[:list] == "target"
			@user.target_schools.delete(school)
			flash[:info] = "#{school_name} deleted from list."
		elsif params[:list] == "reach"
			@user.reach_schools.delete(school)
			flash[:info] = "#{school_name} deleted from list."
		end 

		if @user.save
			redirect_to profile_path
		end 
	end 

	def show_school
		school = params[:id]
	end 

end 