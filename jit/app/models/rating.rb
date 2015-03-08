class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	validates_inclusion_of :discuss, in: [true, false]
end
