class UsersController < ApplicationController

  # every action (except for new and create) is restricted unless the user is signed in
	before_action :authorize, except: [:new, :create]
 
  # starts process of a new user
	def new
		@user = User.new
	end 

 # creates a new user with an empty safety, target, and reach lists
	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
		@user.safety_schools = []
		@user.target_schools = []
		@user.reach_schools = []

		# if the creation is successful, user is directed to their profile where they can start adding schools to their lists
		if @user.save 
			session[:user_id] = @user.id.to_s
			flash[:info] = "Welcome! Start adding schools to your list!" 
			redirect_to profile_path
		else
		# if the creation is unsuccessful, the new user form is rendered again and the user is told the errors in sentence form
			flash.now[:danger] = @user.errors.full_messages.to_sentence
			render :new
		end 

	end 

	def update
	end 
 	
 	# finds the current user and allows access to profile page
	def profile
		@user = User.find(current_user)
	end 


	# allows user to add schools to their safety, reach, and target lists
	def add_school
		# finds current user and sets variable "user"
		@user = User.find(current_user)
		# finds the current school and creates variable "school"
		school = params[:id]
		# creates the school_name variable 
		school_name = School.find(params[:id]).name
		# adds school to safety school list
		if params[:list] == "safety" && @user.safety_schools.exclude?(school) && @user.target_schools.exclude?(school) && @user.reach_schools.exclude?(school)
			@user.safety_schools.push(school)
			flash[:info] = "#{school_name} added as a safety school!" 
		# adds school to target school list
		elsif params[:list] == "target" && @user.safety_schools.exclude?(school) && @user.target_schools.exclude?(school) && @user.reach_schools.exclude?(school)
			@user.target_schools.push(school)
			flash[:info] = "#{school_name} added as a target school!" 
		# adds school to reach school list
		elsif params[:list] == "reach" && @user.safety_schools.exclude?(school) && @user.target_schools.exclude?(school) && @user.reach_schools.exclude?(school)
			@user.reach_schools.push(school)
			flash[:info] = "#{school_name} added as a reach school!" 
		# won't allow user to add specific school to a list if it's already included in the safety school list
		elsif @user.safety_schools.include?(school) 
			flash[:danger] = "#{school_name} is already included as a safety school!" 
		# won't allow user to add specific school to a list if it's already included in the target school list
		elsif @user.target_schools.include?(school)
			flash[:danger] = "#{school_name} is already included as a target school!"
		# won't allow user to add specific school to a list if it's already included in the reach school list
		elsif @user.reach_schools.include?(school)
			flash[:danger] = "#{school_name} is already included as a reach school!"
		end

		# saves the addition and redirects the user to their profile page
		if @user.save
			redirect_to profile_path
		end 

	end 

  # allows user to delete schools from their safety, reach, and target lists
	def delete_school
		# finds current user and sets variable "user"
		@user = User.find(current_user)
		# finds the current school and creates variable "school"
		school = params[:id]
		# creates the school_name variable 
		school_name = School.find(params[:id]).name
		# deletes school from safety school list and alerts user
		if params[:list] == "safety"
			@user.safety_schools.delete(school)
			flash[:info] = "#{school_name} deleted from list."
		# deletes school from target school list and alerts user
		elsif params[:list] == "target"
			@user.target_schools.delete(school)
			flash[:info] = "#{school_name} deleted from list."
		# deletes school from reach school list and alerts user
		elsif params[:list] == "reach"
			@user.reach_schools.delete(school)
			flash[:info] = "#{school_name} deleted from list."
		end 

		# saves the change and redirects the user to their profile page
		if @user.save
			redirect_to profile_path
		end 

	end 

	# takes the user to the show page of the specific school
	def show_school
		school = params[:id]
	end 

end 