class Userkeyword < ActiveRecord::Base
	belongs_to :user
	has_many :keyword
end
