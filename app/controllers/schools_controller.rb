class SchoolsController < ApplicationController
	
  before_action :authorize

  # search action on schools view page
	def index
		if params[:search] && params[:search] != ''
  		reg = ".*" + params[:search] + ".*"
  		@schools = School.where(params[:field].to_sym => /#{reg}/i)
  	else
      # if user isn't searching for a school or location, the index page defaults to showing all schools
    	@schools = School.all
    end
	end 

  # shows the particular school's info
	def show
		@school = School.find(params[:id])
	end 

end 