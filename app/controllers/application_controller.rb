class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:user_id]
  		@current_user ||= User.find(session[:user_id]) 
 	else 
 		@current_user = nil
 	end 

 	return @current_user
 end 


  helper_method :current_user #lets us access this method in our view files

  def current_school
  end 

  def authorize
  	redirect_to login_path unless current_user
  end 

end
