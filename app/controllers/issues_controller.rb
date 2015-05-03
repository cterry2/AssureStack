class IssuesController < ApplicationController
	def show
	    @issue = Issue.includes(:answer).find(params[:id])
	    if @issue.views == nil
	    	@issue.views = 1
	    else
	    	@issue.views = @issue.views + 1
	    end
	    @issue.save

	  end
	def new
		@issue = Issue.new
	end
	def create
	  @issue = Issue.new(issue_params)
	  @issue.views = 0
	  @issue.user_id = session[:user_id]

	  @issue.save
	  redirect_to "#{issues_path}/#{@issue.id}" 
	end

	def addanswer
		@answer = Answer.new(answer_params)
		@answer.score = 0
		@answer.user_id = session[:user_id]
		@answer.save
		redirect_to "#{issues_path}/#{@answer.issue_id}" 
	end

	def answerlist
		@answer = Answer.all
	end

	def incrementvote
		@vote = Answer.find(params[:answerid])

		if (session[:user_id] && Scorelog.where('answerid = ? and userid = ?', @vote.id, session[:user_id]).count == 0)
			@vote.score += 1
			@vote.save
			@scoreupdate = Scorelog.new
			@scoreupdate.answerid = @vote.id
			@scoreupdate.userid = session[:user_id]
			@scoreupdate.save
		end

		respond_to do |format|
  			format.json { render json: @vote.score }
		end 
	end

	def decrementvote
		@vote = Answer.find(params[:answerid])

		if (session[:user_id] && Scorelog.where('answerid = ? and userid = ?', @vote.id, session[:user_id]).count == 0)
			@vote.score -= 1
			@vote.save
			@scoreupdate = Scorelog.new
			@scoreupdate.answerid = @vote.id
			@scoreupdate.userid = session[:user_id]
			@scoreupdate.save
		end

		respond_to do |format|
  			format.json { render json: @vote.score }
		end 
	end

	private
	  def issue_params
	    params.require(:issue).permit(:title, :text, :views, :user_id)
	  end
	  def answer_params
	  	params.require(:answer).permit(:username, :answertext, :issue_id, :score, :user_id)
	  end
end
