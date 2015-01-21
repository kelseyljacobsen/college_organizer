class ListsController < ApplicationController

	def index
		@lists = List.all
	end 

	def show
		@lists = List.all
	end 

end
