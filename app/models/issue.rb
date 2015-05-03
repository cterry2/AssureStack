class Issue < ActiveRecord::Base
	has_many :answer
	has_many :issuecomment
	belongs_to :user
end
