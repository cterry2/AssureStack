class UserController < ApplicationController
	
	def new
	  @user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	    redirect_to root_url
	  else
	    flash[:alert] = "There was a problem creating your account. Please try again."
		redirect_to :back
	  end
	end

	def accountinfo
		@userinfo = User.find(session[:user_id])
		@issues = Issue.all.where("user_id" => session[:user_id])
		@answers = Answer.all.where("user_id" => session[:user_id])
		@keywords = Keyword.all
	end

	def updatekeywords
		@roleuser = Userkeyword.all.where('keyword_id = ? and user_id = ?', params[:keywordid], session[:user_id])
		if @roleuser.count == 0
			@role = Userkeyword.new
			@role.user_id = session[:user_id]
			@role.keyword_id = params[:keywordid]
			@role.save
		else
			Userkeyword.destroy(@roleuser.id)
		end

		respond_to do |format|
  			format.json { render json: true }
		end 
	end

	private
		def user_params
	  		params.require(:user).permit(:email, :password, :password_confirmation)
	  	end
end
