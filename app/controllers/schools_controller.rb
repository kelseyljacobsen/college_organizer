class SchoolsController < ApplicationController
	before_action :authorize

	def index
		if params[:search] && params[:search] != ''
  			reg = ".*" + params[:search] + ".*"
  			@schools = School.where(params[:field].to_sym => /#{reg}/i)
  		else
    		@schools = School.all
    	end
	end 

	def show
		@school = School.find(params[:id])
	end 

end 