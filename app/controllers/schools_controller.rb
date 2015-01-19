class SchoolsController < ApplicationController

	def index
		@schools = School.all
		@lists = List.all
	end 

	def show
		@school = School.find(params[:id])
		@lists = List.all
		# @lists = List.find(@user.list_ids)
		# @user = User.find(session[:user_id])
	end 

	def new
	end 

	def create
	end 

	def edit
	end 

	def update
	end

	def destroy
	end 

end 