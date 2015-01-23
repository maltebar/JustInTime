class Question < ActiveRecord::Base
	belongs_to :user
	has_many :evaluations #for ranking?
end
