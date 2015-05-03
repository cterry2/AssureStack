class Answer < ActiveRecord::Base
	belongs_to :issue
	has_many :answercomment
	belongs_to :user
end
