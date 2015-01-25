class SessionsController < ApplicationController

def new
end 

def create
	user = User.find_by(email: params[:user][:email]) # this doesn't have a view, so we don't need an @ symbol in front of user

	if user && user.authenticate(params[:user][:password]) #user exists and password matches that user's password 
		reset_session
		flash[:success] = "Welcome back, #{user.first_name}!"
		session[:user_id] = user.id.to_s #guarantees that the session[:user_id] will always be a string of the user's id
		redirect_to profile_path
	else
		flash[:danger] = "Uh oh, incorrect password or username. Try again."
		redirect_to root_path
	end 
end 

def destroy
	session[:user_id] = nil
	flash[:success] = "You have successfully logged out!"
	redirect_to root_path
end 

end 