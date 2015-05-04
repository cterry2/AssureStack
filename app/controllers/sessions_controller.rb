class SessionsController < ApplicationController

	def new
	end

	def create
	  @user = User.authenticate(params[:email], params[:password])
	  	
	  if @user
	    session[:user_id] = @user.id
	    flash[:alert] = "You have been signed in!!"
	    redirect_to root_path
	  else
	    flash.now.alert = "Invalid email or password"
	    redirect_to sign_up_path
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end


end
