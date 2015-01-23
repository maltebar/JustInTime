class Question < ActiveRecord::Base
	belongs_to :user
	has_many :evaluations #needed for ranking, or no?
end
