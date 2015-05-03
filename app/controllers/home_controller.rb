class HomeController < ApplicationController
	def index
		@issues = Issue.all.includes(:answer).order(views: :desc)
	end
end
