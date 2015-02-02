class Question < ActiveRecord::Base
	belongs_to :user 
	belongs_to :assignment
	has_many :ratings 
end
